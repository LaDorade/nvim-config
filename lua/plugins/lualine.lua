return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'shatur/neovim-ayu'
		},
		opts = {
			options = {
				component_separators = { left = '', right = '' },
				section_separators   = { left = '', right = '' },
				global_status = true,
			},
			sections = {
				lualine_c = {
					{
						'filename',
						path = 1,
					}
				},

				lualine_x = {
					{ 'filetype' },
				},
				lualine_y = {},
				lualine_z = {
					'location',
					{
						'datetime',
						style = '%x - %X',
						color = {
							gui = 'bold'
						}
					},
				}
			}
		},
	}
}

