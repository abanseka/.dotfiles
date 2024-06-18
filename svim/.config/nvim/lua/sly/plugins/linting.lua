return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")
		local eslint = lint.linters.eslint_d
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

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
			sql = { "sqlfluff" },
			nodejs = { "eslint_d" },
			postgresql = { "pgformatter" },
			sqlite = { "sqlite3" },
			mongodb = { "mongodb-language-server" },
			mysql = { "mysql" },
		}

		eslint.args = {
			"--no-warn-ignored", -- <-- this is the key argument
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
