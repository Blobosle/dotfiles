return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'morhetz/gruvbox'

    use 'ribru17/bamboo.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'ojroques/vim-oscyank'

    use "nvim-lua/plenary.nvim"

    use {
        "ThePrimeagen/harpoon",
        commit = "ccae1b9"
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        use {
            "neovim/nvim-lspconfig",
            tag = "v0.1.9",
        }
    }

    use 'karb94/neoscroll.nvim'

    use 'numToStr/Comment.nvim'

    use 'sainnhe/everforest'

    use 'gaborvecsei/memento.nvim'

    use 'p00f/godbolt.nvim'
end)
