return {
	{
		'shatur/neovim-ayu',
		lazy = false,
		name = "ayu",
		config = function()
			vim.cmd([[colorscheme monokai_vibrant]])
		end,
		priority = 1000
	},
}
