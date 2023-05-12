vim.g.user_emmet_mode = "n"
vim.g.user_emmet_intall_globals = 0
vim.g.user_emmet_leader_key = ","
vim.opt.cursorline = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt_global.fillchars = {
  fold = " ",
  eob = " ",  -- suppress ~ at EndOfBuffer
  diff = " ", -- alternatives = ⣿ ░ ─
}

lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.format_on_save = true
lvim.transparent_window = true
lvim.reload_config_on_save = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.nvimtree.setup.view.width = 50

lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.lsp.document_highlight = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.alpha.active = false
lvim.builtin.dap.active = false
lvim.builtin.bigfile.active = false
lvim.builtin.project.active = false
lvim.builtin.indentlines.active = false
lvim.builtin.illuminate.active = false
