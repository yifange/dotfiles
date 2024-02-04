local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<D-p>", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>.", require("telescope.builtin").resume, desc = "Telescope Resume" },
      { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fb", vim.NIL },
    },
    opts = {
      pickers = {
        lsp_references = {
          show_line = false
        }
      }
    }
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      config = function()
        require("telescope").load_extension("live_grep_args")
      end,
      keys = {
        { "<leader>/", "<cmd>Telescope live_grep_args<cr>", desc = "Grep (root dir)" },
        -- TODO: add keybindings for adding quotes
      }
    },
  },
}
