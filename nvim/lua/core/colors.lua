-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Load nvim color scheme
--require('monokai').setup {}

-- OneDark styles: dark, darker, cool, deep, warm, warmer, light

-- Import color scheme with:
-- require('colors').colorscheme_name

local M = {}

-- Theme: OneDark
--- See: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/colors.lua
M.onedark = {
  bg = '#312c2b',
  fg = '#e4e3e1',
  pink = '#c678dd',
  green = '#adda78',
  cyan = '#56b6c2',
  yellow = '#f0c66f',
  orange = '#f08d71',
  purple = '#9fa0e1',
  red = '#f86882',
}


return M
