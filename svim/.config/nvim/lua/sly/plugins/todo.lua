return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = true,
		sign_priority = 8,
		keywords = {
			fix = {
				icon = "󰾡 ",
				color = "err",
				alt = { "FIX", "BUG", "ISSUE" },
			},
			-- TEST: testing
			TODO = { icon = " ", color = "info", alt = { "TASK" } },
			HACK = { icon = "󱀣 ", color = "warn" },
			WARN = { icon = "󱤮 ", color = "warn", alt = { "ALERT" } },
			PERF = { icon = "󰓅 ", color = "warn", alt = { "OPT", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = "󰟶 ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "󰙨 ", color = "test", alt = { "TEST", "PASS", "FAIL" } },
		},
		gui_style = {
			fg = "NONE",
			bg = "NONE",
		},
		merge_keywords = true,
		highlight = {
			before = "",
			keyword = "fg",
			after = "fg",
		},
		colors = {
			err = { "DiagnosticError", "ErrorMsg", "#FFAAAA" },
			warn = { "DiagnosticWarn", "WarningMsg", "#FFDDBB" },
			info = { "DiagnosticInfo", "#CCE5FF" },
			hint = { "hint", "#A3FFC2" },
			default = { "Identifier", "#D9B3FF" },
			test = { "test", "#FFC2E6" },
		},
	},
}
