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
          -- 'prettier',
          -- 'phpcbf',
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
        },
        -- Alternativni formater za php
        -- phpcbf = {
        --   command = 'phpcbf',
        --   args = { "--standard=PSR12", "$FILENAME" },
        --   stdin = false
        -- }
        php_cs_fixer = {
          args = {
            'fix', '--config=' .. vim.fn.expand('~/.php-cs-fixer.php'), '$FILENAME'
          },
          stdin = false
        },
        -- Ovo je samo ako hoces prettier plugin koji formatira php fajl
        -- prettier = {
        --   command = "prettier",
        --   args = { "--plugin=/usr/local/lib/node_modules/@prettier/plugin-php/standalone.js", "--stdin-filepath", "$FILENAME" },
        --   stdin = true
        -- }
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
