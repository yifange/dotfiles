local hues = require("mini.hues")
math.randomseed(vim.loop.hrtime())

local is_dark = vim.o.background == "dark"
local config = is_dark
		and {
			accent = "bg",
			background = "#182331",
			foreground = "#c2c7cd",
			n_hues = 8,
			plugins = {
				default = true,
			},
			saturation = "medium",
		}
	or {
		accent = "bg",
		background = "#e5e1e7",
		foreground = "#302d32",
		n_hues = 8,
		plugins = {
			default = true,
		},
		saturation = "high",
	}

hues.setup(config)

vim.g.colors_name = "mycolor"
