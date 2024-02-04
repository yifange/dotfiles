return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        { "<leader>fb", "<cmd>Neotree buffers<cr>", desc = "Neotree buffers" },
        { "<leader>fg", "<cmd>Neotree git_status<cr>", desc = "Neotree git-status" },
        { "<leader>fs", "<cmd>Neotree document_symbols<cr>", desc = "Neotree symbols" },
        { "<leader>ft", "<cmd>Neotree reveal<cr>", desc = "Reveal file in Neotree" },
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
      }
    end,
    opts = {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
          { source = "document_symbols"},
        },
      },
    },
  },
}
