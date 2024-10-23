-- Changes the colorsheme of Vim when reading man pages
vim.api.nvim_create_autocmd("FileType", {
    pattern = "man",
    callback = function()
        vim.cmd("colorscheme everforest")
        vim.opt.laststatus = 0
    end,
})

-- Removes the status line when reading man pages
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "man://*",
    callback = function()
        vim.opt.laststatus = 2
    end,
})
