require("Mini.Deps").add({
	source = "utilyre/barbecue.nvim",
	depends = {
		"SmiteshP/nvim-navic",
		-- "nvim-tree/nvim-web-devicons", -- optional dependency
	},
})

require("Mini.Deps").later(function()
	require("barbecue").setup({
		show_modified = true,
		-- https://github.com/neovide/neovide/pull/2165
		lead_custom_section = function()
			return { { " ", "WinBar" } }
		end,
	})
end)
