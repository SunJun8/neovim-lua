-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmp


local opt = vim.opt
local cmp = require 'cmp'
local luasnip = require 'luasnip'

opt.completeopt = menu, menuone, noselect

cmp.setup {
  -- Load snippet support
  snippet = {
    expand = function(args)
      -- For `luasnip` users.
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- Completion settings

  -- Key mapping
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },

  sources = cmp.config.sources (
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    },
    {
      { name = 'buffer' },
    }
  )
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline (
  {
    '/',
    '?'
  },
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  ':',
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        { name = 'path' }
      },
      {
        { name = 'cmdline' },
      }
    )
  }
)

require("luasnip.loaders.from_vscode").lazy_load()
