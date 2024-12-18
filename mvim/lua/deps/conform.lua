require("mini.deps").add({
	source = "stevearc/conform.nvim",
})

require("mini.deps").later(function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },

			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			html = { "prettier" },

			sh = { "shfmt" },
		},
	}
)
end)
