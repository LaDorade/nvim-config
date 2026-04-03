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
						'buffers',
						show_filename_only = false,
						filetype_names = {
							dashboard = 'Dashboard'
						},
					},
					{
						'lsp_status'
					}
				}
			}
		},
	}
}

