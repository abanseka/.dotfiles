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
		"cssls",

		-- golang
		"gopls",
		"gofumpt",
		"golines",
		"goimports-reviser",
	},
}

-- git support in nvimtree
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
			enable = false,
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
				separator = false,
			},
		},
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = { " ", " " },
		hover = { enabled = false },
	},
}

-- local gheight = vim.api.nvim_list_uis()[1].height
-- local gwidth = vim.api.nvim_list_uis()[1].width
M.telescope = {
	defaults = {
		initial_mode = "insert",
		layout_strategy = "vertical",
		layout_config = {
			height = 0.95,
			width = 0.55,
			vertical = {
				mirror = true,
				preview_cutoff = 0,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			only_sort_text = true,
		},
		grep_string = {
			only_sort_text = true,
		},
	},
}

return M
