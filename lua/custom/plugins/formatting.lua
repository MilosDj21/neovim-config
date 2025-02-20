return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        php = {
          'php_cs_fixer',
          -- Ovo ne izgleda ne radi, vidi kako si za python napravio ako ti bude trebalo
          -- args =
          -- {
          --   "fix",
          --   "--using-cache=no",
          --   "--rules=@PSR2",
          --   "--quiet",
          --   vim.api.nvim_buf_get_name(0)
          -- }
        },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' },
        python = { 'pyink' }
      },
      formatters = {
        pyink = {
          prepend_args = {
            '--pyink-indentation', '2',
            '--line-length', '150'
          }
        }
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
