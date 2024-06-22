return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Documents/notes/",
			},
		},
		new_notes_location = "notes/inbox",
		templates = {
			folder = "templates",
			time_format = "%H:%M",
			date_format = "%Y-%m-%d-%a",
		},
		{
			name = "no-vault",
			path = function()
				-- alternatively use the CWD:
				-- return assert(vim.fn.getcwd())
				return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
			end,
			overrides = {
				notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
				new_notes_location = "current_dir",
				templates = {
					folder = vim.NIL,
				},
				disable_frontmatter = true,
			},
		},
	},
}
