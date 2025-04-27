-- In lua/plugins/ai-chat.lua (new name to avoid conflicts)
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      "zbirenbaum/copilot.lua", -- Make sure this matches your existing Copilot plugin
      "nvim-lua/plenary.nvim",
    },
    name = "unique-copilot-chat", -- Give it a unique name
    cmd = {
      "AIChat",
      "AIChatOpen",
      "AIChatToggle",
    },
    config = function()
      local chat = require("CopilotChat")
      chat.setup({
        debug = true,
        window = {
          layout = "float",
          zindex = 50, -- Make sure it's above other UI elements
        },
      })

      -- Create unique commands
      vim.api.nvim_create_user_command("AIChat", function(opts)
        chat.ask(opts.args)
      end, { nargs = "*" })

      vim.api.nvim_create_user_command("AIChatOpen", function()
        chat.open()
      end, {})

      vim.api.nvim_create_user_command("AIChatToggle", function()
        chat.toggle()
      end, {})

      -- Add keymaps
      vim.keymap.set("n", "<D-i>", ":AIChatToggle<CR>", { desc = "Toggle AI Chat" })
      vim.keymap.set("n", "<leader>ac", ":AIChatOpen<CR>", { desc = "Open AI Chat" })
    end,
  },
}
