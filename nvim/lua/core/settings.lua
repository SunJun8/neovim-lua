-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
--- See: https://neovim.io/doc/user/vim_diff.html
--- [2] Defaults - *nvim-defaults*

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd     				      -- Execute Vim commands
local exec = vim.api.nvim_exec 	      -- Execute Vimscript
local g = vim.g         				      -- Global variables
local opt = vim.opt         		      -- Set options (global/buffer/windows-scoped)
--local fn = vim.fn       				    -- Call Vim functions

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'niv'                     -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true                     -- Show line number
opt.relativenumber = true             -- Show line number
opt.showmatch = true                  -- Highlight matching parenthesis
opt.ignorecase = true                 -- Ignore case letters when search
opt.smartcase = true                  -- Ignore lowercase for the whole pattern
opt.termguicolors = true              -- set cursorcolumn
opt.cursorline = true                 -- 高亮当前行
opt.ruler = true                      -- 显示当前行号及列号
opt.cindent = true                    -- C 缩进
opt.hlsearch = true                   -- 高亮搜索
opt.incsearch = true                  -- 键入搜索

g.noshowmode = true                   -- 不显示status
g.nofoldenable = true                 -- 取消自动折叠

-----------------------------------------------------------
-- Neovim theme
-----------------------------------------------------------
g.sonokai_style = 'espresso'
g.sonokai_enable_italic = false
g.sonokai_disable_italic_comment = true
g.sonokai_transparent_background = false

-- g:gruvbox_material_statusline_style = 'mix'
-- g:gruvbox_material_background = 'hard'
-- g:gruvbox_material_enable_italic = 0
-- g:gruvbox_material_disable_italic_comment = 1

cmd [[colorscheme sonokai]]

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true                  -- Use spaces instead of tabs
opt.shiftwidth = 2                    -- Shift 4 spaces when tab
opt.tabstop = 2                       -- 1 tab == 4 spaces
opt.softtabstop = 2                   -- 设置按 tab 时缩进的宽度为 4
opt.smartindent = true                -- Autoindent new lines
g.nowrap = true                       -- 不自动换行
g.Autoindent = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true                     -- Enable background buffers
opt.history = 100                     -- Remember N lines in history
opt.lazyredraw = true                 -- Faster scrolling
opt.synmaxcol = 240                   -- Max column for syntax highlight

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Remove whitespace on save
-- cmd [[au BufWritePre * :%s/\s\+$//e]]


-- Don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line lenght marker for selected filetypes
-- cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
-- cmd [[
--   autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
-- ]]

-- automatically close the tab/vim when nvim-tree is the last window in the tabs
cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------

-- Open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks:
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
opt.shortmess:append "sI"

-- Disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

