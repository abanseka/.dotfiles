return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local c = {
			foam = "#9ccfd8",
			love = "#eb6f92",
			pine = "#31748f",
			iris = "#c4a7e7",
			muted = "#6e6a86",
		}

		local catppuccin = {
			normal = {
				a = { fg = c.foam },
				b = { fg = c.foam },
				c = { fg = c.foam },
			},
			insert = {
				a = { fg = c.iris },
				b = { fg = c.iris },
				c = { fg = c.iris },
			},
			visual = {
				a = { fg = c.foam },
				b = { fg = c.foam },
				c = { fg = c.foam },
			},
			replace = {
				a = { fg = c.muted },
				b = { fg = c.muted },
				c = { fg = c.muted },
			},
			command = {
				a = { fg = c.pine },
				b = { fg = c.pine },
				c = { fg = c.pine },
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
