return {
  vim.keymap.set('i', 'jk', '<ESC>', {desc = 'Exit insert mode with jk'}),
  vim.keymap.set('v', 'jk', '<ESC>', {desc = 'Exit visual mode with jk'}),
  vim.keymap.set('n', '<C-s>', ':w<CR>', {desc = 'Save document'}),
  vim.keymap.set('n', '<C-q>', ':q<CR>', {desc = 'Quit document'}),
}
