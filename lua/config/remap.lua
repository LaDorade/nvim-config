vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Credits to theprimeagen
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste without replacing the content of the 
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy into system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 50 }
  end,
})


vim.keymap.set("n", "U", "<C-r>")

-- terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

-- move
vim.keymap.set('n', '<C-u>', '<C-u>zz');
vim.keymap.set('n', '<C-d>', '<C-d>zz');




















































































