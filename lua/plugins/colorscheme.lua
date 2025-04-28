-- return {
--   -- Add Dracula colorscheme
--   {
--     "Mofiqul/dracula.nvim",
--     lazy = false,
--     priority = 1000,
--   },
--
--   -- Configure LazyVim to use Dracula
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "dracula",
--     },
--   },
-- }

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure it loads before other plugins
    config = function()
      require("catppuccin").setup({
        -- Customize the theme as needed
        flavour = "mocha", -- Available options: latte, frappe, macchiato, mocha
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        term_colors = true,
        -- You can customize specific aspects of the theme here
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          -- For more integrations: https://github.com/catppuccin/nvim#integrations
        },
      })

      -- Set colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
