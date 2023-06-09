local configopts = {}

configopts.on_attach = function(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
end

return configopts
