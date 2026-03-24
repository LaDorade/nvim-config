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
vim.lsp.enable('vtsls')
vim.lsp.enable('eslint')
vim.lsp.enable('svelte')
vim.lsp.enable('nixd')
vim.lsp.enable('tailwindcss')
vim.lsp.config('*', {
	capabilities = capabilities,
	on_attach = function ()
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
	end
})


vim.diagnostic.config({
 virtual_lines = {
   current_line = true
 }
})
