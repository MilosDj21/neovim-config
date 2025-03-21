return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to documents
        ["core.keybinds"] = {
          config = {
            default_keybinds = true -- Adds keybinds
          }
        },
        ["core.dirman"] = { -- Manage directories with Neorg
          config = {
            workspaces = {
              notes = "~neorg/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
