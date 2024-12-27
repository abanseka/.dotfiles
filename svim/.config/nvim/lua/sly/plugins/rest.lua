return {
	"rest-nvim/rest.nvim",
	config = function()
		require("telescope").load_extension("rest")
	end,
}
