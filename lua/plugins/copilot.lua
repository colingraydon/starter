-- In your LazyVim plugins file (like lua/plugins/copilot.lua)
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
            dismiss = "<C-]>",
          },
          -- This enables showing the full suggestion as ghost text
          show_full = true, -- Show the full suggestion, not just the current word
        },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
        },
      })
    end,
  },
}
