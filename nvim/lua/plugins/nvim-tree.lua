-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

--- Keybindings are defined in `core/keymapping.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

--- Note: options under the g: command should be set BEFORE running the
--- setup function: https://github.com/kyazdani42/nvim-tree.lua#setup
--- Default options are not included.
--- See: `help NvimTree`

require('nvim-tree').setup {
  disable_netrw = false,
  hijack_netrw = true,
  respect_buf_cwd = true,
  actions = {
    open_file = {
      resize_window = false,
      quit_on_open = false,
      window_picker = {
        enable = false
      }
    }
  },

  git = {
    enable = false, 
    show_on_dirs = false, 
    show_on_open_dirs = false, 
    disable_for_dirs = {},
    timeout = 400,
  },

  filters = {
    dotfiles = true,
    custom = {
      'node_modules',
      '.cache',
    },
  },

  view = {
    width = 35,
    side = "left",
  },
}
