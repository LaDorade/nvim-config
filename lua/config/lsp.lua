local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- config
local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config('eslint', {
	on_attach = function(client, bufnr)
		if not base_on_attach then return end
		base_on_attach(client, bufnr)
		vim.keymap.set('n', '<leader>es', '<cmd>LspEslintFixAll<cr>')
	end,
})

-- declare
vim.lsp.enable('lua_ls')
vim.lsp.enable('vtsls')
vim.lsp.enable('eslint')
vim.lsp.enable('svelte')
vim.lsp.enable('nixd')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('clangd')
vim.lsp.enable('gopls')
vim.lsp.config('*', {
	capabilities = capabilities,
	on_attach = function (client)
		local isEnabled = true;
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
		vim.keymap.set('n', '<leader>ll', function ()
			if (isEnabled) then
				vim.lsp.buf_detach_client(0, client.id)
			else
				isEnabled = not isEnabled
				vim.lsp.buf_attach_client(0, client.id)
			end
			isEnabled = not isEnabled
		end, {expr = true})
	end
})


vim.diagnostic.config({
 virtual_lines = {
   current_line = true
 }
})
