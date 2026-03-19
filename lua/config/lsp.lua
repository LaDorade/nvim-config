local capabilities = require('cmp_nvim_lsp').default_capabilities()

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config('eslint', {
	on_attach = function(client, bufnr)
		if not base_on_attach then return end
		base_on_attach(client, bufnr)
		vim.keymap.set('n', '<leader>es', '<cmd>LspEslintFixAll<cr>')
	end,
})
vim.lsp.enable('lua_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('svelte')


vim.diagnostic.config({
 virtual_lines = {
   current_line = true
 }
})
