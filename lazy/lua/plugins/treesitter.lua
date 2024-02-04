return {
  {
    "windwp/nvim-ts-autotag",
    ft = { "typescriptreact", "tsx" }, -- the plugin will load depend on file type (check lazy.nvim docs)
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}

