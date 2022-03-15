-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig
-- url: https://github.com/williamboman/nvim-lsp-installer

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function buf_set_keymap(...) vim.api.nvim_set_keymap(...) end

local opts = { noremap=true, silent=true }
-- Mappings.

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
buf_set_keymap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', '<leader>ld', '<cmd>lua require\'lspsaga.provider\'.preview_definition()<CR>', opts)


-- Setup lspconfig by lsp-install.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opt = {}

  -- (optional) Customize the options passed to the server
  if server.name == "clangd" then
    opt.cmd = {"clangd", "--background-index"}
  end

  opt.capabilities = capabilities

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opt)
  end
)

-- lspsaga
require 'lspsaga'.setup()

-- lspfuzzy
require('lspfuzzy').setup()

