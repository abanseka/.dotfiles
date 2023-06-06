---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
local chadoptions = require "custom.chadoptions"

M.ui = {
  theme = "chocolate",
  transparency = true,
  theme_toggle = { "chocolate", "one_light" },
  statusline = {
    theme = "minimal",
    overriden_modules = function()
      return chadoptions.status_override
    end,
  },

  tabufline = { enabled = false },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
