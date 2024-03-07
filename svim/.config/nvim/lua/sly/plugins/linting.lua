return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			json = { "jsonlint" },
			markdown = { "markdownlint" },
			golang = { "golangci-lint" },
			python = { "pylint" },
			java = { "pylint" },
			sql = { "sqlint" },
			nodejs = { "eslint_d" },
			postgresql = { "pgformatter" },
			sqlite = { "sqlite3" },
			mongodb = { "mongodb-language-server" },
			mysql = { "mysql" },
		}

		vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = "lint",
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
