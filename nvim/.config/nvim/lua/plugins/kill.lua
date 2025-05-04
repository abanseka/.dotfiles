vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(function(_, result, ctx, config)
  local filtered = {}
  for _, diagnostic in ipairs(result.diagnostics) do
    -- Filter out spelling suggestions like "Did you mean"
    if not diagnostic.message:match("Did you mean") then
      table.insert(filtered, diagnostic)
    end
  end
  result.diagnostics = filtered
  vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end, {
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})
