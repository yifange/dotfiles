-- return {}
-- return {
--   {
--     "lalitmee/cobalt2.nvim",
--     dependencies = { "tjdevries/colorbuddy.nvim" },
--     config = function()
--       require("colorbuddy").colorscheme("cobalt2")
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "cobalt2",
--     },
--   },
-- }
return {
  -- add gruvbox
  {
    "catppuccin/nvim",
  },
  { "rebelot/kanagawa.nvim" },
  { "rmehri01/onenord.nvim" },
  { "jacoborus/tender.vim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_colors = function(colors)
        colors.border = colors.comment
      end,
    },
  },
  { 'yifange/zephyr-nvim' },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}
--
