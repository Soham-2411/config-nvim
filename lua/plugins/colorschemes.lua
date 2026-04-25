return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			styles = {
				comments = { italic = false }, -- Disable italics in comments
				keywords = { italic = false },
			},
		})
	end,

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				no_italic = false,
				transparent_background = true,
				color_overrides = {
					mocha = {
						base = "#1a1a1a",
						mantle = "#141414",
						crust = "#0f0f0f",
					},
				},
			})
		end,
	},

	-- lua/plugins/rose-pine.lua
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")

			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
