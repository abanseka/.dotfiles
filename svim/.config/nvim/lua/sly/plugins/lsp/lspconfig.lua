return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")

		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		require("lspconfig.ui.windows").default_options = {
			border = "rounded",
		}

		---@diagnostic disable-next-line: unused-local
		local on_attach = function(client, bufnr)
			keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
			keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
			keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definition<cr>", opts)
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
			keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

			keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostic", opts)
			keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
			keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			keymap.set("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
			keymap.set("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

			keymap.set({ "n", "x" }, "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local signs = { Error = "󰠭 ", Warn = " ", Hint = "󰩕 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
		}

		local servers = {
			"prismals",
			"pyright",
			"html",
			"tsserver",
			"cssls",
			"tailwindcss",
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = handlers,
			})
		end

		lspconfig["svelte"].setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		lspconfig["graphql"].setup({
			handlers = handlers,
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["gopls"].setup({
			on_attach = on_attach,
			handlers = handlers,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	end,
}
