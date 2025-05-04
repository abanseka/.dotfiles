return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_inlay_hints_background = "dimmed"
      vim.g.gruvbox_material_current_word = "grey background"
      vim.g.gruvbox_material_inlay_hints_background = "dimmed"
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_disable_terminal_colors = 1
      vim.g.gruvbox_material_enable_italic = false

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_float_border_highlight", { clear = true }),
        pattern = "gruvbox-material",
        callback = function()
          local float_bg = "NONE"
          local float_fg = "#d4be98"
          local dim_gray = "#5a5a5a"
          local selected_bg = "#3c3836"

          -- 🖌 Highlight Helper
          local set = function(group, fg, bg, opts)
            local highlight = { fg = fg, bg = bg }
            if opts then
              for k, v in pairs(opts) do
                highlight[k] = v
              end
            end
            vim.api.nvim_set_hl(0, group, highlight)
          end

          set("FloatBorder", dim_gray, float_bg)
          set("NormalFloat", float_fg, float_bg)
          set("FloatTitle", dim_gray, float_bg)

          set("TelescopeBorder", dim_gray, float_bg)
          set("TelescopePromptBorder", dim_gray, float_bg)
          set("TelescopePreviewBorder", dim_gray, float_bg)

          set("PmenuSbar", nil, nil)
          set("PmenuThumb", nil, nil)
          set("Pmenu", float_fg, float_bg)
          set("PmenuSel", float_fg, selected_bg, { bold = true })

          -- Optionally set this too (some plugins look for it)
          set("PmenuBorder", dim_gray, float_bg)
        end,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "moon",
        extend_background_behind_borders = true,

        highlight_groups = {
          StatusLine = { fg = "love", bg = "love", blend = 10 },
          StatusLineNC = { fg = "subtle", bg = "surface" },
        },

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = false,
          underline = true,
          undercurl = true,
          strikethrough = true,
          special_hlgroups = {
            "DiagnosticHint",
            "DiagnosticInfo",
            "DiagnosticUnderlineHint",
            "DiagnosticUnderlineInfo",
            "DiagnosticUnderlineWarn",
            "DiagnosticUnderlineError",
            "DiagnosticUnderlineWarn",
          },
          transparency = true,
        },

        groups = {
          border = "#393552",
          text = "#d2c09d",
          panel = "#222022",
          base = "#222022",
          surface = "#222022",
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
