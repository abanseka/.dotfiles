return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = false,
    config = function()
      vim.g.codeium_enabled = true
      vim.keymap.set("i", "<C-i>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = os.getenv("OPENAI_API_KEY"),
        show_line_numbers = false,
        highlight = false,
        chat = {
          welcome_message = "",
          default_system_message = [[
              kindly, respond in concise bullet point format. use code snippets to explain concepts
          ]],
          loading_text = "󰦖",
          question_sign = "",
          answer_sign = "󰘹",
          sessions_window = {
            active_sign = "",
            inactive_sign = "",
            current_line_sign = "",
            win_options = { wrap = true, foldcolumn = "0" },
          },
        },
        popup_window = {
          border = { text = { top = "" } },
          highlight = "NormalFloat",
          buf_options = { filetype = "markdown" },
          win_options = {
            foldcolumn = "0",
          },
        },
        system_window = { border = { text = { top = "" } } },
        popup_input = { prompt = "", border = { text = { top = "" } } },
        settings_window = {
          setting_sign = "",
          border = { text = { top = "" } },
        },
        help_window = { setting_sign = "" },
        openai_params = { model = "gpt-4o-mini-2024-07-18", max_tokens = 3000 },
        openai_edit_params = { model = "gpt-4o-mini-2024-07-18" },
      })
    end,
  },
}
