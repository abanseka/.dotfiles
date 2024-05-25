return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local c = {
			orng = "#ff9e64",
			yelw = "#e0af68",
			grn = "#9ece6a",
			grn1 = "#73daca",
			grn2 = "#41a6b5",
			til = "#1abc9c",
			rd = "#f7768e",
			rd1 = "#db4b4b",
		}

		local catppuccin = {
			normal = {
				a = { fg = c.orng },
				b = { fg = c.yelw },
				c = { fg = c.rd },
			},
			insert = {
				a = { fg = c.grn1 },
				b = { fg = c.rd },
				c = { fg = c.rd1 },
			},
			visual = {
				a = { fg = c.orng },
				b = { fg = c.yelw },
				c = { fg = c.grn },
			},
			replace = {
				a = { fg = c.til },
				b = { fg = c.grn2 },
				c = { fg = c.orng },
			},
			command = {
				a = { fg = c.grn },
				b = { fg = c.rd1 },
				c = { fg = c.orng },
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
				lualine_a = { { "branch" } },
				lualine_b = {},
				lualine_c = {
					{
						"diagnostics",
						symbols = { error = "󰠭 ", warn = " ", hint = "󰩕 ", info = " " },
						section_separators = { left = "", right = "" },
						component_separators = { left = "", right = "" },
					},
				},
				lualine_x = {
					{
						"diff",
						symbols = { added = " ", modified = "󰙈 ", removed = " " },
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
