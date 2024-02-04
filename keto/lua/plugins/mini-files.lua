local M = {
	{
		"echasnovski/mini.files",
		version = false,
		config = true,
		keys = {

			{
				"<leader>fm",
				function()
					require("mini.files").open()
				end,
        "mini-files"
			},
		},
		opts = {},
	},
}

return M
