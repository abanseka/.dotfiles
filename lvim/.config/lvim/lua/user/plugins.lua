lvim.plugins = {
	-- theming
	{ "p00f/nvim-ts-rainbow" },
	{ "onsails/lspkind.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				show_end_of_buffer = false, -- show the '~' characters after the end of buffers
				term_colors = true,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
			})
		end,
	},
	-- productivity enhancement
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{ "sindrets/diffview.nvim", event = "BufRead" },
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufRead",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				css = { "stylelint" },
				scss = { "stylelint" },
				markdown = { "markdownlint" },
				json = { "jsonlint" },
				yaml = { "yamllint" },
				go = { "golangcilint" },
				python = { "pylint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				height = 20,
				opacity = 0,
				stack_floating_preview_windows = true,
				preview_window_title = { enable = false },
				border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			})
		end,
	},
	{
		"ggandor/leap.nvim",
		lazy = false,
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"rest-nvim/rest.nvim",
		lazy = false,
		config = function()
			require("rest-nvim").setup({
				result_split_horizontal = true,
			})
		end,
	},
	{
		"aca/emmet-ls",
		config = function()
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig/configs")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			}
			if not lspconfig.emmet_ls then
				configs.emmet_ls = {
					default_config = {
						cmd = { "emmet-ls", "--stdio" },
						filetypes = {
							"html",
							"css",
							"javascript",
							"typescript",
							"eruby",
							"typescriptreact",
							"javascriptreact",
							"svelte",
							"vue",
						},
						root_dir = function(fname)
							return vim.loop.cwd()
						end,
						settings = {},
					},
				}
			end
			lspconfig.emmet_ls.setup({ capabilities = capabilities })
		end,
	},
	-- nice to have
	{
		"andweeb/presence.nvim",
		config = function()
			require("presence").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- ai stuff
	{
		"Exafunction/codeium.vim",
		lazy = false,
		config = function()
			vim.keymap.set("i", "<C-i>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = os.getenv("OPENAI_API_KEY"),
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			vim.g.lsp_zero_extend_lspconfig = 0
			local lspconfig = require("lspconfig")
			local lsp_zero = require("lsp-zero").preset({})
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			local servers = {
				"lua_ls",
				"cssls",
				"tailwindcss",
				"stylelint_lsp",
				"cssmodules_ls",
				"html",
				"tsserver",
				"gopls",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({})
			end

			--cmp
			local cmp = require("cmp")
			local cmp_format = lsp_zero.cmp_format()

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},

				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = require("lspkind").cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
}
