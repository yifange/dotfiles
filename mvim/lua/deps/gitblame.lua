require("mini.deps").add({
	source = "f-person/git-blame.nvim",
})

require("mini.deps").later(require("gitblame").setup({
  enabled = false
}))

