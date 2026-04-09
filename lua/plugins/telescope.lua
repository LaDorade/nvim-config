return {
	{
		'nvim-telescope/telescope.nvim', version = '*',
		lazy = true,
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top"
				}
			}
		},
		keys = {
			{ '<leader>p' , ""}, -- disable <leader>p because it can be annoying if I don't tape fast enough
			{ '<leader>pf', "<cmd>Telescope find_files<cr>", { desc = 'Telescope find files' } },
			{ '<leader>pg', "<cmd>Telescope live_grep<cr>" , { desc = 'Telescope live grep' }},
			{ '<leader>pb', "<cmd>Telescope buffers<cr>"   , { desc = 'Telescope buffers' }},
			{ '<leader>ph', "<cmd>Telescope help_tags<cr>" , { desc = 'Telescope help tags' }},
			{ '<leader>pr', "<cmd>Telescope resume<cr>"    , { desc = 'Resume to last search results' }},
			{ '<leader>ps', function ()
				local builtin = require('telescope.builtin')
				builtin.grep_string({search = vim.fn.input({
					prompt = "Grep > ",
					default = vim.fn.expand("<cword>"),
				})})
			end, { desc = 'Telescope grep_string better' }},
		},
	}
}
