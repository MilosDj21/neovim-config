return {
  {
    "folke/tokyonight.nvim",
    priority = 998, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  -- {
  --    "bluz71/vim-nightfly-guicolors",
  --    priority = 999, -- make sure to load this before all the other start plugins
  --    config = function()
  --      -- load the colorscheme here
  --      vim.cmd([[colorscheme nightfly]])
  --    end,
  --  }
}
