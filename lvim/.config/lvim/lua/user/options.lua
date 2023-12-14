vim.opt.cursorline = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.title = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.diagnostic.config({
	virtual_text = false,
})

vim.o.conceallevel = 1

-------------------------------------------

lvim.format_on_save = true
lvim.transparent_window = true
lvim.reload_config_on_save = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.auto_install = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.alpha.active = false

--------------------------------------------------------
-- lsp config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
	lspconfig[server].setup({
		capabilities = capabilities,
	})
end

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = { default_setup },
})

local cmp = require("cmp")
cmp.setup({
	sources = { { name = "nvim_lsp" } },
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = require("lspkind").cmp_format({
			with_text = false,
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})

-- custom configs
local servers = {
	"cssls",
	"stylelint_lsp",
	"cssmodules_ls",
	"html",
	"tsserver",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

-- lsp keymaps
vim.api.nvim_create_autocmd("lspattach", {
	desc = "lsp actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<f3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<f4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end,
})

-- formatting
---@diagnostic disable: redundant-parameter
local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("lspformatting", {})

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.deno_fmt,
	b.formatting.stylua,
	b.formatting.clang_format,
	b.formatting.gofumpt,
	b.formatting.goimports_reviser,
	b.formatting.golines,
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textdocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("bufwritepre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
