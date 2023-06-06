local chadoptions = {}

chadoptions.status_override = {
  mode = function()
    return ""
  end,
  LSP_Diagnostics = function()
    return ""
  end,
  cursor_position = function()
    return ""
  end,
  LSP_status = function()
    return ""
  end,
  LSP_progress = function()
    return ""
  end,
}

chadoptions.tbufline_override = {
  buttons = function()
    return ""
  end,
  tablist = function()
    return ""
  end,
}
return chadoptions
