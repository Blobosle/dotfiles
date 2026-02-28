return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            automatic_enable = false,
            ensure_installed = { "clangd", "bashls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.diagnostic.config({ virtual_text = true })

            vim.api.nvim_set_hl(0, "DiagnosticDeprecated", { strikethrough = false })

            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    vim.api.nvim_set_hl(0, "DiagnosticDeprecated", { strikethrough = false })
                end,
            })


            local lsp = require("lspconfig")
            lsp.clangd.setup({})
            lsp.bashls.setup({})
        end,
    },
}

