return {
	{
		'folke/flash.nvim', version = '*',
		opts = {
			modes = {
				search = {
					enabled = true,
				},
			},
		},
		keys = {
			{ '<leader>fs', mode = { 'n', 'x', 'o', } , function () require("flash").jump() end, desc = "Flash", }
		},
	},
}
