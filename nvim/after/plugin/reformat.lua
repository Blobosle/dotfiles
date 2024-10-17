-- Deletes all trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.c", "*.lua", "Makefile"},
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

-- Sets tabs to 2 for specific file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "make"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end
})

-- Adds comments on abbreviation
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.cmd('inoreabbrev com /**/<Esc>hi')
  end,
})

