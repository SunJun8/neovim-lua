-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local M = {
  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    -- event = { "LazyFile", "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    opts = {
      highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- list of language that will be disabled
        disable = {},
        additional_vim_regex_highlighting = false,
      },

      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
      },

      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "rust",
        "make",
        "cmake",
        "go",
        "diff",
        "html",
        "json",
        "lua",
        "markdown",
        "python",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
    },

    dependencies = {
      {
        "p00f/nvim-ts-rainbow",
      },
    },

    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

return M
