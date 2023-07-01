-----------------------------------------------------------
-- Plugin: cscope-maps
-----------------------------------------------------------

-- Plugin: cscope-maps
-- url: https://github.com/dhananjaylatkar/cscope_maps.nvim


-- load cscope maps
-- pass empty table to setup({}) for default options
require('cscope_maps').setup(
  {
    disable_maps = false, -- true disables my keymaps, only :Cscope will be loaded
    cscope = {
      db_file = "./cscope.out", -- location of cscope db file
      exec = "cscope", -- "cscope" or "gtags-cscope"
      picker = "fzf-lua", -- "telescope", "fzf-lua" or "quickfix"
    },
  }
)
