require("blobosle")

-- Change to the desired colorscheme
_G.color = "bamboo"

-- gruvbox
-- bamboo

-- General vim editor settings
vim.cmd("set number")
vim.cmd("set linebreak")
vim.cmd("set ruler")
vim.cmd("set expandtab ")
vim.cmd("set scrolloff=10")

-- Default tab settings
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")

-- Trailing characters
vim.cmd("set list")
vim.cmd("set listchars=tab:>.,trail:•")

-- Colorscheme
vim.cmd("colorscheme " .. _G.color)

-- Optional vim options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

--vim.cmd("let g:netrw_keepdir=0")
