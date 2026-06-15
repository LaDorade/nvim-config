return {
	{
		'nvim-mini/mini.surround', version = '*',
		config = function ()
			require('mini.surround').setup()
		end,
	},

	{
		'nvim-mini/mini.pairs', version = '*',
		config = function ()
			-- vim.keymap.set('v', 'sa', surround)
			-- sd, sr, sf, sh
			require('mini.pairs').setup({
				mappings = {
					['('] = { neigh_pattern = '^[^%a%p]' }
				},
			})
		end,
	},

	{
		'nvim-mini/mini.files', version = '*',
		config = function ()
			require('mini.files').setup({
				mappings = {
					go_in = '<cr>',
				},
			})
		end
	}
}
