-- Disables line numbers in terminal mode
function DisableLineNumbers()
  vim.wo.number = false
  vim.wo.relativenumber = false
end

-- Enables line numbers in normal mode
function EnableLineNumbers()
  vim.wo.number = true
  vim.wo.relativenumber = true
end

-- Toggles line numbers in terminal mode
vim.api.nvim_exec([[
  augroup TermNumberToggle
    autocmd!
    autocmd TermOpen * lua DisableLineNumbers()
    autocmd TermClose * lua EnableLineNumbers()
  augroup END
]], false)

-- Custom highlight group for terminal windows
vim.cmd('hi TermNormal guibg=#1e1e1e guifg=white ctermbg=0 ctermfg=white')

-- Autocommand to set winhighlight in terminal windows
vim.api.nvim_exec([[
  augroup TermColorschemeToggle
    autocmd!
    autocmd TermOpen * setlocal winhighlight=Normal:TermNormal
  augroup END
]], false)

-- Command to get rid of the neovim stauts line
vim.cmd('hi TermStatusLine guibg=#1e1e1e guifg=white ctermbg=0 ctermfg=white')

-- Implements the modified status line
function _G.SetTermStatusLineHighlight()
    vim.wo.statusline = '%#TermStatusLine#' .. vim.o.statusline
end

-- Executes status line code to remove it
vim.api.nvim_exec([[
    augroup TermStatusLineHighlight
        autocmd!
        autocmd TermOpen * lua _G.SetTermStatusLineHighlight()
    augroup END
]], false)