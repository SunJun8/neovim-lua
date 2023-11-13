-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua


local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

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