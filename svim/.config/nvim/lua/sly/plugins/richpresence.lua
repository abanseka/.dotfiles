return {
	"andweeb/presence.nvim",
	enabled = false,
	config = function()
		require("presence").setup({
			auto_update = true,
			neovim_image_text = "🏺NEOVIM",
			main_image = "neovim",
			client_id = "793271441293967371",
			log_level = nil,
			debounce_timeout = 10,
			enable_line_number = false,
			blacklist = {},
			buttons = true,
			file_assets = {},
			show_time = false,

			workspace_text = "Working on %s",
			editing_text = nil,
			file_explorer_text = nil,
			git_commit_text = nil,
			plugin_manager_text = nil,
			reading_text = nil,
			line_number_text = nil,
		})
	end,
}
