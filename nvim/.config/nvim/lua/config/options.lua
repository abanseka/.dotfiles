-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false
vim.g.ai_cmp = false

-- border
local _border = "single" -- "rounded" | "single" |
vim.diagnostic.config({ virtual_text = true })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border })
vim.diagnostic.config({ float = { border = _border } })

local opt = vim.opt
opt.autowrite = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.cursorline = false
opt.expandtab = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.jumpoptions = "view"
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.mouse = "a"
opt.number = false
-- opt.numberwidth = 2
vim.opt.wildoptions = "pum"
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = false
opt.ruler = false
opt.scrolloff = 8
opt.shiftround = true
opt.shiftwidth = 2
opt.showcmd = false
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes:1"
opt.smartcase = true
opt.smartindent = true
opt.spell = false
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- general
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.opt.backup = false
vim.opt.cmdheight = 0
vim.opt.conceallevel = 1
vim.opt.fileencoding = "utf"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.swapfile = false
vim.opt.title = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.writebackup = false

--http json formatting
vim.bo.formatexpr = ""
vim.bo.formatprg = "jq"

-- folding related opts
vim.o.foldcolumn = "0"
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- fillchars (already defined in opt)
vim.opt.listchars:append("tab:  ") -- Note the non-breaking space
vim.opt.listchars:append("eol: ")

-- Set filetype for http files
vim.filetype.add({
  extension = {
    ["http"] = "http",
    ["mdx"] = "markdown",
    ["md"] = "markdown",
    ["Avante"] = "markdown",
  },
})
