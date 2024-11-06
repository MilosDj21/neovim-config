return {
  -- Keymaps for better default experience
  -- See `:help vim.keymap.set()`
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }),

  -- Remap for dealing with word wrap
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }),
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }),

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' }),
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' }),
  vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float, { desc = 'Open [F]loating [D]iaggostics' }),
  vim.keymap.set('n', '<leader>qd', vim.diagnostic.setloclist, { desc = 'Open [Q]uickfix [D]iagnostics List' }),


  -- If either location list(example: diagnostics list), or quickfix list are open close it
  vim.keymap.set('n', '<leader>qq',
    function()
      for _, win in ipairs(vim.fn.getwininfo()) do
        if win.loclist == 1 then
          vim.cmd('lclose')
          return
        elseif win.quickfix == 1 then
          vim.cmd('cclose')
          return
        end
      end
    end,
    { desc = 'Close location list, or quickfix list' }),

  vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' }),
  vim.keymap.set('v', 'jk', '<ESC>', { desc = 'Exit visual mode with jk' }),
  vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save document' }),
  vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = 'Quit document' }),
  vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' }),
  vim.keymap.set('n', '<C-h>', ":%s/\\<<C-r><C-w>\\>//gc", { desc = 'Search replace current word' }),
  vim.keymap.set('n', '<C-d>', ":%s/\\(.\\+\\)\\.rs/\\1.rs,\\1/gc",
    { desc = 'Add rs domains without tld to end of line' }),
  vim.keymap.set('n', '<leader>gg', ":Git<CR>", { desc = 'Open git fugitive' }),
  vim.keymap.set('n', '<leader>gc', ":Git commit -m '", { desc = 'Populate command line with ":Git commit -m"' }),
  vim.keymap.set('n', '<leader>gp', ":Git push", { desc = 'Populate command line with ":Git push"' }),
  vim.keymap.set('n', '<leader>ol', ":!explorer.exe '$(wslpath -w $(readlink -f myLink.ln))'",
    { desc = 'Windows explorer follow symlink' }),
  vim.keymap.set('n', '<leader>oe', ":!explorer.exe .<CR>", { desc = 'Open windows explorer in current directory' }),
  vim.keymap.set('n', '<leader>mw', ":set wrap linebreak<CR>", { desc = 'Set wrap in txt file' }),
  vim.keymap.set('n', '<leader>v', "<C-v>", { desc = 'Enter visual block mode' }),
}
