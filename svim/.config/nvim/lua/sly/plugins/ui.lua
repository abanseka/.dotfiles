return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local light = "#45475B"

			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "transparent",
					floats = "transparent",
				},

				on_colors = function(color)
					color.border = light
				end,

				on_highlights = function(hl)
					hl.CursorLine = { bg = light }
					hl.TelescopeBorder = { fg = light }
					hl.TelescopePromptBorder = { fg = light }
				end,
			})

			vim.cmd("colorscheme tokyonight")
		end,
	},
}
