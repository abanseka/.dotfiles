return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local catppuccin = {
			normal = {
				a = { fg = "#B4BEFE" },
				b = { fg = "#45475A" },
				c = { fg = "#181825" },
			},
			insert = {
				a = { fg = "#A6E3A1" },
				b = { fg = "#45475A" },
				c = { fg = "#181825" },
			},
			visual = {
				a = { fg = "#CBA6F7" },
				b = { fg = "#45475A" },
				c = { fg = "#181825" },
			},
			replace = {
				a = { fg = "#F38BA8" },
				b = { fg = "#45475A" },
				c = { fg = "#181825" },
			},
			command = {
				a = { fg = "#FAB387" },
				b = { fg = "#45475A" },
				c = { fg = "#181825" },
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
