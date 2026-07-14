return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Создаем группу аутокманды для привязки LSP
		local lsp_group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = lsp_group,
			callback = function(event)
				-- Функция для создания маппингов (сокращение кода)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- == МАППИНГИ (КЛАВИШИ) ==
				-- Переименовать переменную под курсором
				map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
				-- Показать доступные действия (исправления ошибок, импорты)
				map("gra", vim.lsp.buf.code_action, "[C]ode [A]ction")
				-- Перейти к определению (где создана переменная/функция)
				map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				-- Найти все места, где используется переменная
				map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				-- Перейти к реализации (актуально для интерфейсов/классов)
				map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				-- Показать тип переменной под курсором
				map("grt", require("telescope.builtin").lsp_type_definitions, "[T]ype Definition")
				-- Показать символы в текущем документе (функции, переменные)
				map("gO", require("telescope.builtin").lsp_document_symbols, "[D]ocument Symbols")
				-- Показать окно с описанием ошибки под курсором
				map("gl", vim.diagnostic.open_float, "Show diagnostic [L]og")
				-- Показать все диагностики текущего буфера в списке ошибок
				map("gL", function()
					vim.diagnostic.setloclist({ open = true })
				end, "Show all diagnostics for current buffer")

				-- Получаем клиента, который подключился
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				-- Включение/выключение подсказок типов внутри кода (Inlay Hints)
				if client and client.server_capabilities.inlayHintProvider then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end

				if client and client.name == "ruff" then
					client.server_capabilities.hoverProvider = false
				end
			end,
		})

		vim.lsp.config("basedpyright", {
			capabilities = capabilities,
			settings = {
				basedpyright = {
					disableOrganizeImports = true,
					analysis = {
						typeCheckingMode = "off",
						diagnosticMode = "openFilesOnly",
						autoImportCompletions = false,
						autoSearchPaths = false,
						useLibraryCodeForTypes = true,
						diagnosticSeverityOverrides = {
							reportAttributeAccessIssue = "error",
							reportMissingImports = "error",
						},
					},
				},
			},
		})
		-- vim.lsp.enable("basedpyright")

		-- Ruff
		vim.lsp.config("ruff", {
			capabilities = capabilities,
			init_options = {
				settings = {
					-- First check project settings, after - ide settings
					configurationPreference = "filesystemFirst",
					lint = {
						enable = true,
						select = {
							-- "ALL",
							"E",
							"F",
							"W",
							"I",
							"B",
							"UP",
							"ANN",
							"SIM",
							"C4",
							"PIE",
						},
						ignore = {
							"E501", -- длина строки
						},
					},
					fixAll = true,
					format = {
						enable = false,
					},
				},
			},
		})
		vim.lsp.enable("ruff")

		-- ty
		vim.lsp.config("ty", {
			settings = {
				ty = {
					-- configuration = {
					-- 	rules = {
					-- ["possibly-missing-attribute"] = "error",
					-- ["possibly-missing-import"] = "error",
					-- ["possibly-unresolved-reference"] = "error",
					-- ["unsupported-dynamic-base"] = "error",
					-- 	},
					-- },
				},
			},
		})
		vim.lsp.enable("ty")

		-- Lua LS
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- версия Lua, используемая в Neovim
						version = "LuaJIT",
					},
					diagnostics = {
						-- включаем только проверки, относящиеся к коду
						globals = { "vim" }, -- чтобы не ругался на глобальную переменную vim
						workspaceDelay = 2000,
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					format = {
						enable = false, -- отключаем встроенный форматтер, если используем отдельный
					},
					hover = {
						enable = false,
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

		vim.filetype.add({
			pattern = {
				["%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
				[".*/%.gitlab/.*%.ya?ml"] = "yaml.gitlab",
			},
		})
		vim.lsp.config("gitlab_ci_ls", {
			capabilities = capabilities,
			init_options = {
				cache = vim.fn.stdpath("cache") .. "/gitlab-ci-ls", -- путь к кэшу
				log_path = vim.fn.stdpath("data") .. "/gitlab-ci-ls.log", -- лог LS
				options = {
					dependencies_autocomplete_stage_filtering = false, -- включить фильтрацию автокомплита по stage, если нужно
				},
			},
			filetypes = { "yaml.gitlab" },
		})
		vim.lsp.enable("gitlab_ci_ls")

		vim.lsp.config("yamlls", {
			settings = {
				yaml = {
					schemaStore = { enable = true, url = "https://www.schemastore.org/" },
					schemas = {
						["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
							".gitlab-ci.yml",
							"/.gitlab/*/*.yml",
							"/.gitlab/*/*.yaml",
						},
						["https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json"] = {
							"docker-compose.yaml",
							"docker-compose.yml",
						},
					},
					format = {
						enable = false,
					},
					validate = true,
					completion = true,
					hover = false,
					editor = { formatOnType = false },
				},
			},
		})
		vim.lsp.enable("yamlls")

		vim.filetype.add({
			pattern = {
				["Dockerfile.*"] = "dockerfile",
				["Dockerfile"] = "dockerfile",
				[".*Dockerfile"] = "dockerfile",
			},
		})
		vim.lsp.config("dockerls", {
			cmd = { "docker-language-server", "start", "--stdio" },
			filetypes = {
				"dockerfile",
				"yaml.docker-compose",
				"bake",
			},
			single_file_support = true,
			initializationOptions = {
				dockercomposeExperimental = {
					composeSupport = true,
				},
				dockerfileExperimental = {
					removeOverlappingIssues = true,
				},
				telemetry = "off",
			},
			capabilities = {
				experimental = {
					dockerLanguageServerCapabilities = {
						commands = "dockerLspClient.bake.build",
					},
				},
			},
		})

		-- vim.lsp.config("marksman", {
		-- 	capabilities = capabilities,
		-- 	cmd = { "marksman", "server" },
		-- 	filetypes = { "markdown", "markdown.mdx", ". },
		-- 	root_markers = { ".marksman.toml", ".git" },
		-- })
		-- vim.lsp.enable("marksman")

		-- == НАСТРОЙКА ВИЗУАЛА ДИАГНОСТИКИ ==
		vim.diagnostic.config({
			severity_sort = true, -- Сортировать ошибки по важности
			float = { border = "rounded", source = "if_many" },
			underline = false, -- Подчеркивать только критические ошибки (меньше шума)
			virtual_text = false, -- ОТКЛЮЧАЕМ текст ошибки справа от кода (убирает визуальный шум и лаги), используйте наведение мыши или `gl`
			-- Если хотите вернуть текст справа, замените virtual_text = false на:
			-- virtual_text = { spacing = 4, prefix = "●" },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
			},
		})
	end,
}
