return {
  {
    "ThePrimeagen/harpoon",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<leader>mm", function() require("harpoon.ui").toggle_quick_menu() end, "Toggle Harpoon menu" },
      { "<leader>ma", function() require("harpoon.mark").add_file() end, "Harpoon mark file"},
      { "<leader>[", function() require("harpoon.ui").nav_prev() end, "Harpoon prev"},
      { "<leader>]", function() require("harpoon.ui").nav_next() end, "Harpoon prev"},
    },
    opts = {   
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      }  -- tabline = true,
    }
  },
}
