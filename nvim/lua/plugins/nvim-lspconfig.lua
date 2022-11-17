-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig
-- url: https://github.com/williamboman/nvim-lsp-installer
-- url: https://github.com/williamboman/mason-lspconfig.nvim
-- url: https://github.com/williamboman/mason.nvim

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function buf_set_keymap(...) vim.api.nvim_set_keymap(...) end

local opts = { noremap=true, silent=true }
-- Mappings.

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
buf_set_keymap('n', '<leader>lw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
buf_set_keymap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason").setup(
  {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
)

-- enable the `mason-lspconfig` plugin
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup{
      capabilities = capabilities
    }
  end

  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
}

-- lspfuzzy
require('lspfuzzy').setup()

