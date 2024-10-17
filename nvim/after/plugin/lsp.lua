require("mason").setup()

-- Setup the current and new language servers
require("mason-lspconfig").setup {
    ensure_installed = {"clangd", "pylsp"},
}

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
end

-- Required setup for C LSP (clangd)
require("lspconfig").clangd.setup {
  on_attach = on_attach
}

-- Required setup for python LSP (pylsp)
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}
