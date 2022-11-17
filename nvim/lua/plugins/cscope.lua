-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

-- Cscope
local exec = vim.api.nvim_exec 	      -- Execute Vimscript

local function map(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true
  }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<F5>', ':!cscope -Rbcq<CR>:cs reset<CR><CR>', { noremap = false })

exec (
  [[
    set csprg=/usr/bin/cscope
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    set csto=0
    set cst
    if filereadable("cscope.out")
        silent cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        silent cs add $CSCOPE_DB
    endif
  ]], false
)

-- Find this C symbol
map('n', '<C-_>s', ':cs find s <C-R>=expand("<cword>")<CR><CR>')
-- Find this definition
map('n', '<C-_>g', ':cs find g <C-R>=expand("<cword>")<CR><CR>')
-- Find functions calling this function
map('n', '<C-_>c', ':cs find c <C-R>=expand("<cword>")<CR><CR>')
-- Find this text string
map('n', '<C-_>t', ':cs find t <C-R>=expand("<cword>")<CR><CR>')
-- Find this egrep pattern
map('n', '<C-_>e', ':cs find e <C-R>=expand("<cword>")<CR><CR>')
-- Find this file
map('n', '<C-_>f', ':cs find f <C-R>=expand("<cfile>")<CR><CR>')
-- Find files #including this file
map('n', '<C-_>i', ':cs find i ^<C-R>=expand("<cfile>")<CR>$<CR')
-- Find functions called by this function
map('n', '<C-_>d', ':cs find d <C-R>=expand("<cword>")<CR><CR>')
map('n', '<C-_>a', ':cs find a <C-R>=expand("<cword>")<CR><CR>')

