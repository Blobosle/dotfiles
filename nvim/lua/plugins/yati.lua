return {
    {
        "yioneko/nvim-yati",
        version = "*",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                yati = { enable = true, default_lazy = true },
                indent = { enable = false },
            })
        end,
    },
}

