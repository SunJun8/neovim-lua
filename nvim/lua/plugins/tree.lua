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
local g = vim.g

g.nvim_tree_width_allow_resize  = 1

local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(
  function ()
    bufferline_state.set_offset(36, "File Tree")
  end
)

nvim_tree_events.on_tree_close(
  function ()
    bufferline_state.set_offset(0)
  end
)

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
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.vscode' },
  },
  view = {
    width = 35,
    side = "left",
  },
}
