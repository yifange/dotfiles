local add = require("mini.deps").add
local later = require("mini.deps").later

add({
	source = "nvim-treesitter/nvim-treesitter",
})

later(function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "vim", "vimdoc", "tsx", "html", "css", "typescript", "javascript" },

		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	})
end)
