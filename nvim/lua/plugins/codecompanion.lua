return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
		adapters = {
			http = {
				["llama.cpp"] = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "http://127.0.0.1:8080", -- replace with your llama.cpp instance
							api_key = "TERM",
							chat_url = "/v1/chat/completions",
						},
						handlers = {
							parse_message_meta = function(self, data)
								local extra = data.extra
								if extra and extra.reasoning_content then
									data.output.reasoning = { content = extra.reasoning_content }
									if data.output.content == "" then
										data.output.content = nil
									end
								end
								return data
							end,
						},
					})
				end,
			},
		},
		interactions = {
			chat = {
				-- You can specify an adapter by name and model (both ACP and HTTP)
				tools = {
					["web_search"] = {
						opts = {
							adapter = "duckduckgo",
						},
						["delete_file"] = {
							enabled = function()
								return false
							end,
						},
						["run_command"] = {
							opts = {
								allowed_in_yolo_mode = true,
								judge_in_yolo_mode = true,
							},
						},
						groups = {
							["full_agent"] = {
								description = "Полный набор тулов (без удаления файлов)",
								system_prompt = "Ты автономный агент-редактор кода. Сам решай, какие инструменты использовать, не спрашивай пользователя без явной необходимости (используй ask_questions только если реально не хватает контекста для продолжения). Никогда не удаляй файлы. Никогда не выполняй `git commit`, `git push` или любые команды, публикующие изменения, без явного запроса пользователя в текущем сообщении.",
								tools = {
									"agent",
									"files",
									"fetch_webpage",
									"memory",
									"run_command",
									"web_search",
								},
								opts = {
									collapse_tools = true, -- в чате отображается как одна группа, а не 12 строк
								},
							},
						},
					},
					opts = {
						default_tools = { "full_agent" }, -- прикрепляется ко всем новым чатам
						auto_submit_errors = true,
						auto_submit_success = true,
					},
				},
				adapter = "llama.cpp",
				opts = {
					completion_provider = "blink", -- blink|cmp|coc|default
					context_management = {
						enabled = true,
					},
				},
			},
			-- Or, just specify the adapter by name
			inline = {
				adapter = "llama.cpp",
				keymaps = {
					accept_change = { modes = { n = "ga" }, description = "Accept" },
					reject_change = { modes = { n = "gr" }, opts = { nowait = true }, description = "Reject" },
				},
			},
			cmd = {
				adapter = "llama.cpp",
			},
			background = {
				chat = {
					opts = { enabled = true },
				},
				adapter = "llama.cpp",
				gates = {
					judge = {
						enabled = true,
						adapter = "llama.cpp", -- судья тоже локальный, тот же адаптер/сервер
						system_prompt = function(default_prompt)
							return default_prompt
								.. "Дополнительно: считай НЕБЕЗОПАСНЫМИ и требующими подтверждения пользователя любые команды, которые создают git-коммит или отправляют изменения в удалённый репозиторий — например `git commit`, `git push`, `gh pr merge`, `git push --force`. Всё остальное (чтение файлов, установка зависимостей, запуск тестов, линтеров, сборка, `git status`, `git diff`, `git add`, `git stash`) считай безопасным и разрешай автоматически."
						end,
					},
				},
			},
			-- cli = {
			-- 	agent = "claude_code",
			-- 	agents = {
			-- 		claude_code = {
			-- 			cmd = "claude",
			-- 			args = {},
			-- 			description = "Claude Code CLI",
			-- 			provider = "terminal",
			-- 		},
			-- 	},
			-- },
		},
		display = {
			chat = {
				window = {
					position = "right", -- Options: "left", "right", "top", "bottom"
					width = 0.35, -- Relative width (35% of screen) or absolute (e.g., 45)
				},
			},
			action_palette = {
				width = 95,
				height = 10,
				prompt = "Prompt ", -- Prompt used for interactive LLM calls
				provider = "telescope", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
				opts = {
					show_preset_actions = true, -- Show the preset actions in the action palette?
					show_preset_prompts = true, -- Show the preset prompts in the action palette?
					title = "CodeCompanion actions", -- The title of the action palette
				},
			},
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)

		-- Автоматически включаем YOLO-режим для каждого нового чата,
		-- чтобы не жать `gty` руками каждый раз
		vim.api.nvim_create_autocmd("User", {
			pattern = "CodeCompanionChatCreated",
			callback = function(args)
				local chat = require("codecompanion").buf_get_chat(args.data.bufnr)
				local approvals = require("codecompanion.interactions.chat.tools.approvals")
				if chat and approvals and not chat.yolo_mode then
					approvals:toggle_yolo_mode()
				end
			end,
		})
	end,
}
