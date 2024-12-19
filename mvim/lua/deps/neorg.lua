local add = MiniDeps.add

-- luarocks support
local path_package = vim.fn.stdpath("data") .. "/site"
local luarocks = path_package .. "pack/luarocks/"
local lr_path = luarocks .. "share/lua/5.1/"
local lr_cpath = luarocks .. "lib/lua/5.1/"
package.path = table.concat({
	package.path,
	lr_path .. "?.lua",
	lr_path .. "?/init.lua",
}, ";")
package.cpath = table.concat({
	package.cpath,
	lr_cpath .. "?.so",
}, ";")

local function install_luarocks(args)
	if vim.fn.executable("luarocks") ~= 1 then
		return
	end

	local rockspec = vim.fs.find(function(name, _)
		return name:match(".*%-1.rockspec$")
	end, { path = args.path, type = "file", limit = 1 })

	vim.system({
		"luarocks",
		"--tree",
		luarocks,
		"install",
		"--deps-only",
		"--lua-version",
		"5.1",
		"--deps-mode",
		"one",
		rockspec[1],
	}):wait()
end

local lr_add = function(tbl)
	tbl["hooks"] = {
		post_install = install_luarocks,
		post_checkout = install_luarocks,
	}

	add(tbl)
end

lr_add({
	source = "nvim-neorg/neorg",
})
require("mini.deps").add({
	source = "nvim-neorg/neorg",
	depends = {
		"nvim-lua/plenary.nvim",
		"nvim-neorg/lua-utils.nvim",
		"pysan3/pathlib.nvim",
		"nvim-neotest/nvim-nio",
		"MunifTanjim/nui.nvim",
	},
})

MiniDeps.now(function()
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
			["core.completion"] = {
				{ config = { engine = "nvim-cmp", name = "[Norg]" } },
			},
			["core.integrations.nvim-cmp"] = {},
			["core.text-objects"] = {},
		},
	})
end)
