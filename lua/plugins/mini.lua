return {
	{
		'nvim-mini/mini.nvim', version = '*',
		config = function ()
			require('mini.surround').setup()
			-- vim.keymap.set('v', 'sa', surround)
			-- sd, sr, sf, sh
			require('mini.pairs').setup()
		end
	},
}
