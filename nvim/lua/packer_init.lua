-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Easily speed up your neovim startup time
  use 'nathom/filetype.nvim'
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
  }

  -- FZF
  use {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
    },
    -- run = 'cd ~/.nvim-fzf && ./install --all',
  }

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- cscope fzf
  use 'SunJun8/fzf_cscope.vim'

  --lastplace
  use 'farmergreg/vim-lastplace'

  -- multi action
  use 'mg979/vim-visual-multi'

  -- Treesitter interface
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'

  -- cursorline
  use {
    'yamatsum/nvim-cursorline',
    config = function()
      require('nvim-cursorline').setup()
    end
  }

  -- Color schemes
  use 'sainnhe/sonokai'

  -- tab
  use 'romgrk/barbar.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'ojroques/nvim-lspfuzzy'
  use 'nvim-lua/lsp-status.nvim'

  -- LSP install
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      -- luasnip
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    },
  }
  -- LSP UI

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Search hightlight
  use 'kevinhwang91/nvim-hlslens'

  -- Replace
  use 'windwp/nvim-spectre'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    'voldikss/vim-translator'
  }

end)
