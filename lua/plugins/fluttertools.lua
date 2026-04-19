return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			lsp = {
				settings = {
					enableSdkFormatter = true,
					updateImportsOnRename = true,
				},
				color = {
					enabled = false,
				},
			},
		})
	end,
}
