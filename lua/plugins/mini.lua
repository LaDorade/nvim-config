return {
	{
		'nvim-mini/mini.nvim', version = '*',
		config = function ()
			require('mini.surround').setup()
			require('mini.pairs').setup()
			require('mini.align').setup()
		end
	},
}
