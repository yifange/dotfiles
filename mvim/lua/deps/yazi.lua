require("mini.deps").add({
  source = "mikavilpas/yazi.nvim",
  depends = {
    "nvim-lua/plenary.nvim"
  }
})

require("mini.deps").later(function() 
  require("yazi").setup()
end)
