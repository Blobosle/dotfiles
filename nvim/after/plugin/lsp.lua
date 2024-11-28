require("mason").setup()
require("mason-lspconfig").setup()

-- Setup the current and new language servers
require("mason-lspconfig").setup {
    ensure_installed = {"clangd"},
}

local on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

-- Required setup for C LSP (clangd)
require("lspconfig").clangd.setup {
    on_attach = on_attach
}
