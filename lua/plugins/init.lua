if vim.fn.has("nvim-0.9.0") == 0 then
    vim.api.nvim_echo({
        { "LazyVim requires Neovim >= 0.9.0\n", "ErrorMsg" },
        { "Press any key to exit",              "MoreMsg" },
    }, true, {})
    vim.fn.getchar()
    vim.cmd([[quit]])
    return {}
end

local treesitter = require('plugins.ui.treesitter')


return {
    treesitter,
}
