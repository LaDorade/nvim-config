return {
	{
		'catppuccin/nvim',
		lazy = false,
		name = "catppuccin",
		opts = {
			flavor = "mocha"
		},
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
		priority = 1000
	},
}
