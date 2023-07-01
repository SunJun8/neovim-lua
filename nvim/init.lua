--[[

Neovim init file
Version: 0.50.0 - 2022/03/07
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require('packer_init')
require('core/settings')
require('core/keymaps')
require('plugins/alpha/alpha-nvim')
require('plugins/lualine/nvim-lualine')
require('plugins/nvim-tree')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/nvim-spectre')
require('plugins/nvim-hlslens')
require('plugins/nvim-outline')
require('plugins/nvim-gitsigns')
require('plugins/nvim-barbar')
require('plugins/nvim-cscope-maps')
-- require('plugins/nvim-copilot')
