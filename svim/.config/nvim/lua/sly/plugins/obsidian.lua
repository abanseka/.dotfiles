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
		notes_subdir = "inbox",
		new_notes_location = "notes_subdir",
		templates = {
			folder = "templates",
			time_format = "%H:%M:%S",
			date_format = "%Y-%m-%d",
		},

		-- note id
		---@param title string|?
		---@return string
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		-- note path
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		note_path_func = function(spec)
			local path = spec.dir / tostring(spec.id)
			return path:with_suffix(".md")
		end,

		-- note frontmatter
		---@return table
		note_frontmatter_func = function(note)
			if note.title then
				note:add_alias(note.title)
			end

			local out = { id = note.id, tags = note.tags }

			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end
			return out
		end,
	},
}
