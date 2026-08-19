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
			},
			cmd = {
				adapter = "llama.cpp",
			},
			background = {
				adapter = "llama.cpp",
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
}
