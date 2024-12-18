require("mini.deps").add({
	source = "dmmulroy/tsc.nvim",
})

require("mini.deps").later(function()
	require("tsc").setup({
		use_trouble_qflist = true,
	})
end)
