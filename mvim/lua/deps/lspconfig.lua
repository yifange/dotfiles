local add = require("mini.deps").add
local later = require("mini.deps").later

add({
	source = "neovim/nvim-lspconfig",
	depends = { "williamboman/mason.nvim" },
})

later(function()
	require("mason").setup()
end)
