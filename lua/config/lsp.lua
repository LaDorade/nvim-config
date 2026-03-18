local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('luals', {
	cmd = {'lua-language-server'},
	capabilities = capabilities,
	filetypes = {'lua'},
	root_markers = {'.luarc.json', '.luarc.jsonc'},
})
vim.lsp.enable('luals')
vim.lsp.enable('eslint') -- imported via nvim-lspconfig

vim.diagnostic.config({
 -- virtual_lines = {
 --   current_line = true
 -- }
 virtual_lines = true,
})
