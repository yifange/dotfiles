local now = require("mini.deps").now
local later = require("mini.deps").later

later(function()
	require("mini.statusline").setup()
end)

later(function()
	require("mini.align").setup()
end)

later(function()
	local animate = require("mini.animate")
	animate.setup({
		scroll = {
			-- Disable Scroll Animations, as the can interfer with mouse Scrolling
			enable = false,
		},
		cursor = {
			timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
		},
	})
end)

-- later(function()
-- 	require("mini.base16").setup({
-- 		palette = {
-- 			base00 = "#1e1e2e",
-- 			base01 = "#181825",
-- 			base02 = "#313244",
-- 			base03 = "#45475a",
-- 			base04 = "#585b70",
-- 			base05 = "#cdd6f4",
-- 			base06 = "#f5e0dc",
-- 			base07 = "#b4befe",
-- 			base08 = "#f38ba8",
-- 			base09 = "#fab387",
-- 			base0A = "#f9e2af",
-- 			base0B = "#a6e3a1",
-- 			base0C = "#94e2d5",
-- 			base0D = "#89b4fa",
-- 			base0E = "#cba6f7",
-- 			base0F = "#f2cdcd",
-- 		},
-- 	})
-- end)

later(function()
	require("mini.basics").setup({
		options = {
			basic = true,
			extra_ui = true,
			win_borders = "single",
		},
		mappings = {
			basic = true,
			windows = true,
			option_toggle_prefix = "<leader>u",
		},
		autocommands = {
			basic = true,
			relnum_in_visual_mode = true,
		},
	})
end)
later(function()
	require("mini.bracketed").setup()
end)
later(function()
	require("mini.bufremove").setup()
end)

later(function()
	require("mini.clue").setup({
		triggers = {
			-- Leader triggers
			{ mode = "n", keys = "<LocalLeader>" },
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },

			{ mode = "n", keys = "\\" },

			-- Built-in completion
			{ mode = "i", keys = "<C-x>" },

			-- `g` key
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },

			-- Marks
			{ mode = "n", keys = "'" },
			{ mode = "n", keys = "`" },
			{ mode = "x", keys = "'" },
			{ mode = "x", keys = "`" },

			-- Registers
			{ mode = "n", keys = '"' },
			{ mode = "x", keys = '"' },
			{ mode = "i", keys = "<C-r>" },
			{ mode = "c", keys = "<C-r>" },

			-- Window commands
			{ mode = "n", keys = "<C-w>" },

			-- `z` key
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },

			-- brackets
			{ mode = "n", keys = "[" },
			{ mode = "n", keys = "]" },
		},

		clues = {
			{ mode = "n", keys = "<Leader>b", desc = " Buffer" },
			{ mode = "n", keys = "<Leader>f", desc = " Find" },
			{ mode = "n", keys = "<Leader>g", desc = "󰊢 Git" },
			{ mode = "n", keys = "<Leader>o", desc = " Operators" },
			{ mode = "n", keys = "<Leader>c", desc = "󰘦 Code" },
			-- { mode = "n", keys = "<Leader>q", desc = " NVim" },
			{ mode = "n", keys = "<Leader>j", desc = " Jump" },
			{ mode = "n", keys = "<Leader>s", desc = "󰆓 Session" },
			{ mode = "n", keys = "<Leader>u", desc = "󰔃 UI" },
			{ mode = "n", keys = "<Leader>w", desc = " Window" },
			require("mini.clue").gen_clues.g(),
			require("mini.clue").gen_clues.builtin_completion(),
			require("mini.clue").gen_clues.marks(),
			require("mini.clue").gen_clues.registers(),
			require("mini.clue").gen_clues.windows(),
			require("mini.clue").gen_clues.z(),
		},
		window = {
			delay = 300,
		},
	})
end)
later(function()
	require("mini.colors").setup()
end)
later(function()
	require("mini.comment").setup()
end)
-- later(function()
-- 	require("mini.completion").setup(
-- 		-- {
-- 		-- mappings = {
-- 		-- 	go_in = "<RET>",
-- 		-- },
-- 		-- window = {
-- 		-- 	info = { border = "solid" },
-- 		-- 	signature = { border = "solid" },
-- 		-- },
-- 		-- }
-- 	)
-- end)
later(function()
	require("mini.cursorword").setup()
end)
later(function()
	require("mini.diff").setup({
		view = {
			style = "sign",
			-- signs = { add = "█", change = "▒", delete = "" },
		},
	})
end)
later(function()
	require("mini.doc").setup()
end)
later(function()
	require("mini.extra").setup()
end)

now(function()
	require("mini.files").setup({
		mappings = {
			go_in = "L",
			go_in_plus = "l",
		},
		windows = {
			preview = true,
			border = "solid",
			width_preview = 80,
		},
		options = {
			use_as_default_explorer = true,
		},
	})
end)
later(function()
	require("mini.fuzzy").setup()
end)
later(function()
	require("mini.git").setup()
end)

later(function()
	local hipatterns = require("mini.hipatterns")

	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
end)

-- later(function()
--    require('mini.hues').setup({
--        background = '#e1dbd1',
--        foreground = '#000000',
--        n_hues     = 2,
--        accent     = 'red',
--        saturation = 'high'
--    })
-- end)
later(function()
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()
end)
later(function()
	require("mini.indentscope").setup({
		draw = {
			animation = function()
				return 1
			end,
		},
		symbol = "│",
	})
end)
later(function()
	require("mini.jump").setup()
end)
later(function()
	require("mini.jump2d").setup({
		mappings = {
			start_jumping = "<leader>jj",
		},
	})
end)
later(function()
	require("mini.map").setup()
end)
later(function()
	require("mini.misc").setup()
end)
later(function()
	require("mini.move").setup()
end)

later(function()
	--          ┌─────────────────────────────────────────────────────────┐
	--            We took this from echasnovski's personal configuration
	--           https://github.com/echasnovski/nvim/blob/master/init.lua
	--          └─────────────────────────────────────────────────────────┘
	local filterout_lua_diagnosing = function(notif_arr)
		local not_diagnosing = function(notif)
			return not vim.startswith(notif.msg, "lua_ls: Diagnosing")
		end
		notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
		return require("mini.notify").default_sort(notif_arr)
	end
	require("mini.notify").setup({
		content = { sort = filterout_lua_diagnosing },
		window = { config = { border = "solid" } },
	})
	vim.notify = require("mini.notify").make_notify()
end)
later(function()
	require("mini.operators").setup({
		-- Each entry configures one operator.
		-- `prefix` defines keys mapped during `setup()`: in Normal mode
		-- to operate on textobject and line, in Visual - on selection.

		-- Evaluate text and replace with output
		evaluate = {
			prefix = "<leader>o=",
		},

		-- Exchange text regions
		exchange = {
			prefix = "<leader>ox",

			-- Whether to reindent new text to match previous indent
			reindent_linewise = true,
		},

		-- Multiply (duplicate) text
		multiply = {
			prefix = "<leader>om",
		},

		-- Replace text with register
		replace = {
			prefix = "<leader>or",

			-- Whether to reindent new text to match previous indent
			reindent_linewise = true,
		},

		-- Sort text
		sort = {
			prefix = "<leader>os",
		},
	})
end)
later(function()
	require("mini.pairs").setup()
end)

later(function()
	local win_config = function()
		local height = math.floor(0.8 * vim.o.lines)
		local width = math.floor(0.8 * vim.o.columns)
		return {
			-- anchor = "NW",
			height = height,
			width = width,
			-- border = "solid",
			-- row = math.floor(0.5 * (vim.o.lines - height)),
			-- col = math.floor(0.5 * (vim.o.columns - width)),
		}
	end

	require("mini.pick").setup({
		mappings = {
			choose_in_vsplit = "<C-CR>",
			choose_marked = "<C-q>",
		},
		options = {
			use_cache = true,
		},
		window = {
			config = win_config,
		},
	})
	vim.ui.select = MiniPick.ui_select
end)
now(function()
	require("mini.sessions").setup({
		autowrite = true,
	})
end)
later(function()
	require("mini.splitjoin").setup()
end)

now(function()
	require("mini.starter").setup({
		autoopen = true,
	})
end)

later(function()
	require("mini.surround").setup()
end)
later(function()
	require("mini.tabline").setup()
end)
later(function()
	require("mini.trailspace").setup()
end)
later(function()
	require("mini.visits").setup()
end)

-- https://github.com/echasnovski/mini.nvim/blob/main/doc/mini-completion.txt#L132-L154
local keycode = vim.keycode or function(x)
	return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
	["cr"] = keycode("<CR>"),
	["ctrl-y"] = keycode("<C-y>"),
	["ctrl-y_cr"] = keycode("<C-y><CR>"),
}

_G.cr_action = function()
	if vim.fn.pumvisible() ~= 0 then
		-- If popup is visible, confirm selected item or add new line otherwise
		local item_selected = vim.fn.complete_info()["selected"] ~= -1
		return item_selected and keys["ctrl-y"] or keys["ctrl-y_cr"]
	else
		-- If popup is not visible, use plain `<CR>`. You might want to customize
		-- according to other plugins. For example, to use 'mini.pairs', replace
		-- next line with `return require('mini.pairs').cr()`
		return keys["cr"]
	end
end

vim.keymap.set("i", "<CR>", "v:lua._G.cr_action()", { expr = true })
