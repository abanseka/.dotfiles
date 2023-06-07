local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"json",
		"bash",
		"yaml",
	},
	indent = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- c/cpp stuf"n", "l", api.tree.expand_all, opts "Expand All"
		"clangd",
		"clang-format",

		-- golang
		"gopls",
		"gofumpt",
		"golines",
		"goimports-reviser",
	},
}

-- git support in nvimtree

local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
M.nvimtree = {
	on_attach = require("custom.configs.configopts").on_attach(),
	git = {
		enable = false,
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_label = false,
		indent_markers = {
			enable = false,
		},
		icons = {
			show = {
				git = false,
				file = true,
				folder = true,
				folder_arrow = false,
			},
			glyphs = {
				folder = {
					default = " ",
					open = " ",
					empty = " ",
					empty_open = " ",
				},
			},
		},
	},
	view = {
		float = {
			enable = true,
			open_win_config = {
				border = "rounded",
				width = 60,
				height = 20,
				-- to lazy to add centering logic here
				row = (gheight - 20) * 0.5,
				col = (gwidth - 60) * 0.5,
			},
		},
	},
}

M.bufferline = {
	options = {
		indicator = {
			icon = " ",
			style = "none",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		diagnostics = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				separator = true,
			},
		},
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = { " ", " " },
		hover = { enabled = false },
	},
}

return M
