local present, null_ls = pcall(require, "null-ls")
local configopts = require "custom.configs.configopts"

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
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          configopts.async_formatting(bufnr)
        end,
      })
    end
  end,
}
