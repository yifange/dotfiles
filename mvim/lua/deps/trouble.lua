local add = require("mini.deps").add
local later = require("mini.deps").later

add({
	source = "folke/trouble.nvim",
})

later(function()
	require("trouble").setup()
end)
