-- enable transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.opt.termguicolors = true
vim.opt.number = false
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 1
vim.opt.fileencoding = "utf"
vim.opt.foldmethod = "manual"
vim.opt.foldexpr = ""
vim.opt.guifont = "monospace:h17"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.title = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = false
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.laststatus = 3

-- folding related opts
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- border
local _border = "rounded"
vim.diagnostic.config({ virtual_text = false })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border })
vim.diagnostic.config({ float = { border = _border } })

-- fillchars
vim.opt_global.fillchars = {
	fold = " ",
	eob = " ",
	diff = "╱",
}
