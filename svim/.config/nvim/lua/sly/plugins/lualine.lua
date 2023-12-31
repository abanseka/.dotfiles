return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local palette = {
			rosewater = "#f5e0dc",
			flamingo = "#f2cdcd",
			pink = "#f5c2e7",
			mauve = "#cba6f7",
			red = "#f38ba8",
			maroon = "#eba0ac",
			peach = "#fab387",
			yellow = "#f9e2af",
			green = "#a6e3a1",
			teal = "#94e2d5",
			sky = "#89dceb",
			sapphire = "#74c7ec",
			blue = "#89b4fa",
			lavender = "#b4befe",
		}

		local catppuccin = {
			normal = {
				a = { fg = palette.rosewater },
				b = { fg = palette.flamingo },
				c = { fg = palette.pink },
			},
			insert = {
				a = { fg = palette.mauve },
				b = { fg = palette.red },
				c = { fg = palette.maroon },
			},
			visual = {
				a = { fg = palette.peach },
				b = { fg = palette.yellow },
				c = { fg = palette.green },
			},
			replace = {
				a = { fg = palette.teal },
				b = { fg = palette.sky },
				c = { fg = palette.sapphire },
			},
			command = {
				a = { fg = palette.blue },
				b = { fg = palette.lavender },
				c = { fg = palette.rosewater },
			},
		}

		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = catppuccin,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = {
					{
						"diagnostics",
						symbols = { error = "󰃤 ", warn = "󰠠 ", hint = "󰌵 ", info = " " },
						section_separators = { left = "", right = "" },
						component_separators = { left = "", right = "" },
					},
				},
				lualine_x = {
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						section_separators = { left = "", right = "" },
						component_separators = { left = "", right = "" },
					},
				},
				lualine_y = {},
				lualine_z = { "filetype" },
			},
		})
	end,
}
