-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
  ensure_installed =
    {
      "c",
      "cpp",
      "python",
      "markdown",
      "make",
      "cmake",
      "ninja",
      "go",
      "help",
      "html",
      "java",
      "rust",
    },

  git = {
    ignore = 0
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {
      "lua",
      "log"
    },

    additional_vim_regex_highlighting = false,
  },

  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },

  indent = {
    enable = true
  }
}
