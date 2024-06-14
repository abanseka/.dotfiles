return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local function on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Parent Directory"))
			vim.keymap.set("n", "l", api.node.open.edit, opts("Help")) -- Removed parentheses after api.node.open.edit
		end

		nvimtree.setup({
			on_attach = on_attach,
			sync_root_with_cwd = true,
			respect_buf_cwd = false,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			hijack_cursor = false,
			disable_netrw = false,
			hijack_netrw = false,
			reload_on_bufenter = true,
			select_prompts = false,
			view = {
				centralize_selection = false,
				cursorline = false,
				debounce_delay = 15,
				side = "right",
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
				width = 30,
				float = {
					enable = false,
				},
			},
			renderer = {
				add_trailing = false,
				group_empty = false,
				full_name = false,
				root_folder_label = false,
				indent_width = 2,
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
				highlight_git = true,
				highlight_diagnostics = false,
				highlight_opened_files = "none",
				highlight_modified = "none",
				highlight_bookmarks = "none",
				highlight_clipboard = "name",
				indent_markers = {
					enable = false,
					inline_arrows = false,
					icons = {
						corner = "▏",
						edge = "▏", -- ▎▏│
						item = "▏",
						bottom = "",
						none = " ",
					},
				},
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
					git_placement = "before",
					modified_placement = "after",
					diagnostics_placement = "signcolumn",
					bookmarks_placement = "signcolumn",
					padding = " ",
					symlink_arrow = " ",
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
						modified = false,
						diagnostics = false,
						bookmarks = true,
					},
					glyphs = {
						default = "󰈙 ",
						symlink = "󱅷 ",
						bookmark = " ",
						modified = " ",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = " ",
							open = " ",
							empty = " ",
							empty_open = " ",
						},
						git = {
							unstaged = "",
							staged = "",
							unmerged = "",
							renamed = "",
							untracked = "",
							deleted = "",
							ignored = "",
						},
					},
				},
			},
			system_open = {
				cmd = "",
				args = {},
			},
			git = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = false,
				disable_for_dirs = {},
				timeout = 400,
				cygwin_support = false,
			},
			diagnostics = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = " ",
					info = " ",
					warning = " ",
					error = " ",
				},
			},
			modified = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = false,
			},
			filters = {
				git_ignored = true,
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = {},
				exclude = {},
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = {},
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = false,
					restrict_above_cwd = false,
				},
				expand_all = {
					max_folder_discovery = 300,
					exclude = {},
				},
				file_popup = {
					open_win_config = {
						col = 1,
						row = 1,
						relative = "cursor",
						border = "rounded",
						style = "minimal",
					},
				},
				open_file = {
					quit_on_open = false,
					eject = true,
					resize_window = true,
					window_picker = {
						enable = true,
						picker = "default",
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
			},
			trash = {
				cmd = "gio trash",
			},
			tab = {
				sync = {
					open = false,
					close = false,
					ignore = {},
				},
			},
			notify = {
				threshold = vim.log.levels.INFO,
				absolute_path = true,
			},
			help = {
				sort_by = "key",
			},
			ui = {
				confirm = {
					remove = true,
					trash = true,
					default_yes = false,
				},
			},
			experimental = {},
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					dev = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		})

		-- set keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "explorer" })
	end,
}
