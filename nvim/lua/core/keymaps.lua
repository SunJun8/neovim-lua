-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local cmd = vim.cmd     				      -- Execute Vim commands

local function map(mode, lhs, rhs)
  local options = {
    noremap = true,
    silent = true
  }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Fast saving with <leader> and s
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<C-c>:w<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>Q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })    -- open
map('t', '<Esc>', '<C-\\><C-n>')                      -- exit

-- NvimTree
map('n', '<F4>', ':NvimTreeToggle<CR>')               -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>')         -- refresh
map('n', '<leader>t', ':NvimTreeFindFileToggle<CR>')  -- search file

--spectre
map('n', '<leader>S',  ':lua require(\'spectre\').open()<CR>')
map('n', '<leader>sw', ':lua require(\'spectre\').open_visual({select_word=true})<CR>')
map('v', '<leader>s',  ':lua require(\'spectre\').open_visual()<CR>')
map('n', '<leader>sp', 'viw:lua require(\'spectre\').open_file_search()<CR>')

-- Bufferline
map('n','<leader><leader>', ':BufferPrevious<CR>')
map('n','<leader>.', ':BufferNext<CR>')
map('n','<leader>bp', ':BufferPin<CR>')
map('n','<leader>bq', ':BufferClose<CR>')
map('n','<leader>bc', ':BufferCloseAllButCurrent<CR>')
map('n','<leader>bl', ':BufferCloseBuffersLeft<CR>')
map('n','<leader>br', ':BufferCloseBuffersRight<CR>')

-- clangformat
map('', '<leader>mm', ':py3f /home/jokeo/tool/clang/tools/clang-format/clang-format.py<CR>')

-- astyle
map('', '<leader>mn', ':!astyle --style=gnu --indent=spaces=2 -K -S --max-code-length=78<CR>')
map('', '<leader>mb', ':!astyle --style=stroustrup --indent=spaces=4 -S --max-code-length=100<CR>')

map('n', '<F2>', ':%!astyle --style=gnu --indent=spaces=2 -K -S --max-code-length=78<CR>')

-- FZF
map('n', '<F8>', ':Files<CR>', { noremap = false })
map('n', '<leader>fl', ':BLines<CR>')
map('n', '<leader>fb', ':Buffers<CR>')
