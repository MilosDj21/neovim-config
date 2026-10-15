return {
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 998, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('tokyonight').setup({
  --       style = "night",
  --       on_highlights = function(hl, c)
  --         -- hl.Normal = { bg = "#0d0d11" }
  --       end,
  --       on_colors = function(colors)
  --         colors.bg = "#0b0b09"
  --         -- colors.bg = "#0d0d10"
  --         colors.bg_sidebar = "#0d0d10"
  --       end
  --     })
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight-night]])
  --   end,
  -- },
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
          -- transparent = true,                -- Disable setting background
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
        groups = {
          all = {
            Normal = { bg = "#0f0f0f" },
            -- NormalNC = { bg = "#0f0f0f" },
            -- NormalFloat = { bg = "#0f0f0f" },
            -- FloatBorder = { fg = "#0f0f0f" }
            -- render-markdown heading text
            RenderMarkdownH1 = { fg = "#ff6b6b", style = "bold" },
            RenderMarkdownH2 = { fg = "#2eea4e", style = "bold" },
            RenderMarkdownH3 = { fg = "#f7f376", style = "bold" },
            RenderMarkdownH4 = { fg = "#2ea0e8", style = "bold" },
            RenderMarkdownH5 = { fg = "#4dabf7", style = "bold" },
            RenderMarkdownH6 = { fg = "#b197fc", style = "bold" },

            -- render-markdown heading backgrounds
            RenderMarkdownH1Bg = { bg = "#3b2323" },
            RenderMarkdownH2Bg = { bg = "#1f3b26" },
            RenderMarkdownH3Bg = { bg = "#3a391f" },
            RenderMarkdownH4Bg = { bg = "#1f1f3a" },
            RenderMarkdownH5Bg = { bg = "#1f2f3b" },
            RenderMarkdownH6Bg = { bg = "#2e263b" },

            -- raw heading text (e.g. in insert mode)
            ["@markup.heading.1.markdown"] = { fg = "#ff6b6b", style = "bold" },
            ["@markup.heading.2.markdown"] = { fg = "#2eea4e", style = "bold" },
            ["@markup.heading.3.markdown"] = { fg = "#f7f376", style = "bold" },
            ["@markup.heading.4.markdown"] = { fg = "#2ea0e8", style = "bold" },
            ["@markup.heading.5.markdown"] = { fg = "#4dabf7", style = "bold" },
            ["@markup.heading.6.markdown"] = { fg = "#b197fc", style = "bold" },
          }
        },
      })
      -- setup must be called before loading
      vim.cmd("colorscheme carbonfox")
    end
  }
}
