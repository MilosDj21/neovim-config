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
  {
    "EdenEast/nightfox.nvim",
    priority = 997,
    config = function()
      -- Default options
      require('nightfox').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false,               -- Disable setting background
          terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,              -- Non focused panes set to alternative background
          module_default = true,             -- Default enable value for modules
          colorblind = {
            enable = false,                  -- Enable colorblind support
            simulate_only = false,           -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0,                    -- Severity [0,1] for protan (red)
              deutan = 0,                    -- Severity [0,1] for deutan (green)
              tritan = 0,                    -- Severity [0,1] for tritan (blue)
            },
          },
          styles = {           -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })
      -- setup must be called before loading
      vim.cmd("colorscheme carbonfox")
    end
  }
}
