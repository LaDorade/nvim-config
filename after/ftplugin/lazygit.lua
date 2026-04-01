-- shotout to https://github.com/kdheepak/lazygit.nvim/issues/127#issuecomment-2388718237
-- This maps the esc key to its normal behavior only for lazygit terminal window.
vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<Esc>', {noremap = true, silent = true})

