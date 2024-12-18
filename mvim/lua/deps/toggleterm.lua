require("mini.deps").add({
	source = "akinsho/toggleterm.nvim",
})

require("mini.deps").later(function()
	require("toggleterm").setup({
		open_mapping = [[<c-`>]],
		direction = "float",
    start_in_insert = true,
	})
end)

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

local function _lazygit_toggle()
	lazygit:toggle()
end

vim.keymap.set("n", "<leader>gg", function()
	_lazygit_toggle()
end, { noremap = true, silent = true })
