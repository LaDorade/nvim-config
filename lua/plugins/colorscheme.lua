return {
	{
		'kepano/flexoki-neovim',
		name = 'flexoki', lazy = false,
		config = function()
			vim.cmd([[colorscheme flexoki]])
		end,
		priority = 1000
	},
}
