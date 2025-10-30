return {
  -- Custom Keymaps
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

  --  Various custom keymaps
  vim.keymap.set({ 'i', 'v' }, 'jk', '<ESC>', { desc = 'Exit insert or visual mode with jk' }),
  vim.keymap.set('n', '<leader>v', "<C-v>", { desc = 'Enter visual block mode' }),
  vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save document' }),
  vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Quit document' }),
  vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' }),
  vim.keymap.set('n', '<C-d>', ":%s/\\(.\\+\\)\\.rs/\\1.rs,\\1/gc",
    { desc = 'Add rs domains without tld to end of line' }),
  vim.keymap.set('n', '<leader>mw', "<cmd>set wrap linebreak<CR>", { desc = 'Set wrap in txt file' }),

  -- Search replace keymaps
  vim.keymap.set('n', '<leader>sr', ":%s/\\<\\(<C-r><C-w>\\)\\>//gc<left><left><left>",
    { desc = '[S]earch [R]eplace current word' }),
  vim.keymap.set('n', '<leader>sp', function()
    local word = vim.fn.expand("<cword>")  -- current word under cursor
    local replacement = vim.fn.getreg('"') -- last yanked text
    -- keymap special characters to avoid breaking :s
    replacement = replacement:gsub("%%", "%%%%")
    replacement = replacement:gsub("/", "\\/")
    replacement = replacement:gsub("&", "\\&")
    -- replace only the word under cursor in the whole file silently
    local cmd = string.format("s/\\<%s\\>/%s/", word, replacement)
    vim.cmd(cmd)
  end, { desc = "Replace current word with yanked text" }),

  -- Git related keymaps
  vim.keymap.set('n', '<leader>gg', "<cmd>Git<CR>", { desc = 'Open git fugitive' }),
  vim.keymap.set('n', '<leader>gc', ":Git commit -m '", { desc = 'Populate command line with ":Git commit -m"' }),
  vim.keymap.set('n', '<leader>gp', ":Git push", { desc = 'Populate command line with ":Git push"' }),
  vim.keymap.set('n', '<leader>gf', "<cmd>Git fetch<CR>", { desc = '[G]it [F]etch' }),
  vim.keymap.set('n', '<leader>gl', "<cmd>Git pull<CR>", { desc = '[G]it Pull' }),

  -- Windows related keymaps
  vim.keymap.set('n', '<leader>ol', ":!explorer.exe '$(wslpath -w $(readlink -f myLink.ln))'",
    { desc = 'Windows explorer follow symlink' }),
  -- vim.keymap.set('n', '<leader>oe', "<cmd>!explorer.exe $(wslpath -w %:p:h)<CR>",
  -- { desc = 'Open windows explorer in current directory' }),
  vim.keymap.set('n', '<leader>oe', "<cmd>!dolphin %:p:h &<CR>",
    { desc = 'Open dolphin explorer in current directory' }),

  -- Neorg related keymaps
  vim.keymap.set('n', '<leader>nn', "<Plug>(neorg.dirman.new-note)", { desc = 'New note' }),
  vim.keymap.set('n', '<leader>njt', "<cmd>Neorg journal today<CR>", { desc = 'Open journal for today' }),
  vim.keymap.set('n', '<leader>ntd', "<Plug>(neorg.qol.todo-items.todo.task-done)", { desc = 'Mark task as [D]one' }),
  vim.keymap.set('n', '<leader>ntu', "<Plug>(neorg.qol.todo-items.todo.task-undone)", { desc = 'Mark task as [U]done' }),
  vim.keymap.set('n', '<leader>ntp', "<Plug>(neorg.qol.todo-items.todo.task-pending)",
    { desc = 'Mark task as [P]ending' }),

  vim.keymap.set('n', '<leader>nf', function()
    require('telescope.builtin').find_files({
      cwd = vim.fn.expand('~/neorg/notes'),
      find_command = {
        'fdfind', '--type', 'f', '--exclude', 'journal'
      },
    })
  end, { desc = '[F]ind Notes' }),

  vim.keymap.set('n', '<leader>ng', function()
    require('telescope.builtin').live_grep({
      cwd = vim.fn.expand('~/neorg/notes'),
      additional_args = function()
        return { '--glob', '!journal/*' }
      end,
    })
  end, { desc = 'Live [G]rep Notes', noremap = true }),

  vim.keymap.set('n', '<leader>njf', function()
    require('telescope.builtin').find_files({
      cwd = vim.fn.expand('~/neorg/notes/journal'),
    })
  end, { desc = '[F]ind Journals' }),

  vim.keymap.set('n', '<leader>njg', function()
    require('telescope.builtin').live_grep({
      cwd = vim.fn.expand('~/neorg/notes/journal')
    })
  end, { desc = 'Live [G]rep Journals', noremap = true }),
}
