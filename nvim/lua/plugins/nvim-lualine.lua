
-----------------------------------------------------------
-- lualine configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmpa


require('lualine').setup {
    options = {
      theme = 'gruvbox-material',
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff'},
      lualine_c = {{ 'filename', file_status = false, path = 1 }},
      lualine_x = {'encoding', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
}
