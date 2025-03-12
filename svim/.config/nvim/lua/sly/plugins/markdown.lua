return {
	"MeanderingProgrammer/render-markdown.nvim",
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		bullet = {
			icons = { " ", " ", " ", " " },
		},
		link = {
			image = "󰈟 ",
			email = " ",
			hyperlink = "󱘖 ",
			wiki = { icon = "󰖬 ", highlight = "RenderMarkdownWikiLink" },
			custom = {
				web = { pattern = "^http", icon = " " },
				youtube = { pattern = "youtube%.com", icon = "󰗃 " },
				github = { pattern = "github%.com", icon = " " },
				neovim = { pattern = "neovim%.io", icon = " " },
				discord = { pattern = "discord%.com", icon = " " },
				reddit = { pattern = "reddit%.com", icon = " " },
				golang = { pattern = "golang%.org", icon = " " },
				stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
			},
		},
		dash = { width = 20 },
		checkbox = {
			position = "inline",
			unchecked = {
				icon = " ",
				highlight = "RenderMarkdownUnchecked",
				scope_highlight = nil,
			},
			checked = {
				icon = " ",
				highlight = "RenderMarkdownChecked",
				scope_highlight = nil,
			},
			custom = {
				todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
			},
		},
		callout = {
			note = {
				rendered = " NOTE",
			},
		},
		heading = {
			sign = false,
			icons = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
			width = "block",
			backgrounds = {},
			foregrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
			},
		},
	},
}
