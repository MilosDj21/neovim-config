return {
  {
    "folke/tokyonight.nvim",
    priority = 998, -- make sure to load this before all the other start plugins
    config = function()
      require('tokyonight').setup({
        style = "night",
        on_highlights = function(hl, c)
          -- hl.Normal = { bg = "#0d0d11" }
        end,
        on_colors = function(colors)
          colors.bg = "#0b0b09"
          -- colors.bg = "#0d0d10"
          colors.bg_sidebar = "#0d0d10"
        end
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  -- {
  --   "bluz71/vim-nightfly-guicolors",
  --   priority = 999,  -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme nightfly]])
  --   end,
  -- },
  --   {
  --     -- Theme inspired by Atom
  --     'navarasu/onedark.nvim',
  --     priority = 1000,
  --     lazy = false,
  --     config = function()
  --       require('onedark').setup {
  --         -- Set a style preset. 'dark' is default.
  --         style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
  --       }
  --       require('onedark').load()
  --     end,
  --   },
}
