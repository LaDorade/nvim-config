return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'shatur/neovim-ayu'
		},
		opts = {
			sections = {
				lualine_c = {
					{
						'datetime',
						style = '%x - %X',
						color = {
							gui = 'bold'
						}
					},
					{
						'filename',
						filename = 1,
					},
					{
						'lsp_status'
					}
				}
			}
		},
	}
}

