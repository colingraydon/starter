return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<D-g>", -- This directly maps the dismiss action
          },
          show_full = true,
        },
        panel = { enabled = false },
      })

      -- You can add additional customization for dismissed suggestions
      local last_dismissed_line = nil

      -- Track dismissed suggestions
      local group = vim.api.nvim_create_augroup("CopilotCustom", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = "CopilotSuggestionDismissed",
        group = group,
        callback = function()
          last_dismissed_line = vim.api.nvim_win_get_cursor(0)[1]
        end,
      })

      -- Reset tracking when cursor moves
      vim.api.nvim_create_autocmd("CursorMovedI", {
        group = group,
        callback = function()
          local current_line = vim.api.nvim_win_get_cursor(0)[1]
          if last_dismissed_line and current_line ~= last_dismissed_line then
            last_dismissed_line = nil
          end
        end,
      })
    end,
  },
}
