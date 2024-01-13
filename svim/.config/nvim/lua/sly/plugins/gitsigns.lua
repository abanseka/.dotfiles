return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "" },
				change = { text = "" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "" },
				untracked = { text = "" },
			},
			preview_config = {
				border = "rounded",
				style = "minimal",
			},
			on_attach = function(bufnr)
				local function map(mode, lhs, rhs, opts)
					opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
					vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
				end

				-- Navigation
				map("n", "<leader>gk", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
				map("n", "<leader>gj", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

				-- Actions
				map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
				map("v", "<leader>gs", ":Gitsigns stage_hunk<CR>")
				map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
				map("v", "<leader>gr", ":Gitsigns reset_hunk<CR>")
				map("n", "<leader>gb", "<cmd>Gitsigns stage_buffer<CR>")
				map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
				map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>")
				map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
				map("n", "<leader>gl", "<cmd>Gitsigns blame_line<CR>")
				map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
			end,
		})
	end,
}
