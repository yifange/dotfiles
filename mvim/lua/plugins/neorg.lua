-- require("mini.deps").add({
-- 	source = "nvim-neorg/neorg",
-- 	depends = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-neorg/lua-utils.nvim",
-- 		"pysan3/pathlib.nvim",
-- 		"nvim-neotest/nvim-nio",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- })
--
-- require("mini.deps").later(function()
-- 	require("neorg").setup({
-- 		load = {
-- 			["core.defaults"] = {},
-- 			["core.concealer"] = {},
-- 			["core.dirman"] = {
-- 				config = {
-- 					workspaces = {
-- 						notes = "~/Neorg",
-- 					},
--           use_popup = false,
-- 				},
-- 			},
-- 			-- ["core.completion"] = {},
-- 			["core.text-objects"] = {},
-- 		},
-- 	})
-- end)
--
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/Neorg",
				},
				use_popup = false,
			},
		},
		-- ["core.completion"] = {
		-- 	{ config = { engine = "nvim-cmp", name = "[Norg]" } },
		-- },
		--   ["core.integrations.nvim-cmp"] = {},
		["core.text-objects"] = {},
	},
})
