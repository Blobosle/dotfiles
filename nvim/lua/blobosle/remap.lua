-- Leader key mapping
vim.g.mapleader = ' '

-- Option settings for keymaps
local opts = { noremap = true, silent = true }

-- Copy and paste functionality (OSC52 sequence)
vim.keymap.set('n', '<C-c>', '<Plug>OSCYankOperator')
vim.keymap.set('v', '<C-c>', '<Plug>OSCYankVisual')

-- Opening Netrw
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)

-- Sets the cursor to block mode
vim.opt.guicursor = ""

-- Disable default mappings
vim.keymap.set('n', "Q", "<nop>")
vim.api.nvim_set_keymap('t', '<C-q>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<C-q>', '<Nop>', opts)
vim.api.nvim_set_keymap('v', '<C-q>', '<Nop>', opts)
vim.api.nvim_set_keymap('x', '<C-q>', '<Nop>', opts)
vim.api.nvim_set_keymap('o', '<C-q>', '<Nop>', opts)
vim.api.nvim_set_keymap('i', '<C-S>', '<Nop>', opts)

-- Opening shell instance on the edited directory (whole screen)
_G.cd_and_open_term = function()
    local original_dir = vim.fn.getcwd()
    vim.cmd('cd %:p:h')
    vim.cmd('term')

    vim.cmd('autocmd TermClose * ++once lua vim.cmd("cd ' .. original_dir .. '")')
end

-- Opening shell instance on the edited directory (split screen)
_G.cd_and_open_term_mod = function()
    local original_win = vim.api.nvim_get_current_win()
    local original_dir = vim.fn.getcwd()

    vim.cmd('lcd %:p:h')
    vim.cmd('vsplit')
    vim.cmd('term')

    local new_win = vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(original_win)
    vim.cmd('lcd ' .. original_dir)
    vim.api.nvim_set_current_win(new_win)

    vim.cmd('autocmd TermClose * ++once lua vim.api.nvim_set_current_win(' .. new_win .. ')')
end

-- Calls the function to open a new shell instance in a whole window
vim.api.nvim_set_keymap('n', 'Q', ':lua cd_and_open_term()<CR>', opts)

-- Sets new splits for the right side
vim.opt.splitright = true

-- Calls the function to open a new shell instance in a split window
vim.api.nvim_set_keymap('n', '<leader>q', ':lua _G.cd_and_open_term_mod()<CR>', opts)

-- Autocompletion key to exit the terminal automatically
vim.api.nvim_set_keymap('t', '<C-q>', [[<C-\><C-n>i exit<CR>]], opts)

-- Opens a new tab in Newtr in the edited directory
_G.open_netrw_in_file_dir = function()
    local original_file_dir = vim.fn.expand('%:p:h')
    local original_dir = vim.fn.getcwd()

    vim.cmd('tabnew')
    vim.cmd('lcd ' .. original_file_dir)
    vim.cmd('Explore')
    vim.cmd('lcd ' .. original_dir)
    vim.cmd('autocmd TabLeave * ++once lua vim.cmd("lcd ' .. original_dir .. '")')
end

-- Calls the funciton to open a new tab with Newtr on the working directory
vim.api.nvim_set_keymap('n', '<leader>w', ':lua _G.open_netrw_in_file_dir()<CR>', opts)

-- Cycling between numerous tabs
vim.api.nvim_set_keymap('n', 'A', ':tabnext<CR>', opts)

-- Commands to shorten Vim editor writing and exits
vim.api.nvim_set_keymap('n', 'ZC', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', 'ZX', ':q!<CR>', opts)
vim.api.nvim_set_keymap('n', 'ZA', ':w<CR>', opts)
vim.api.nvim_set_keymap('n', 'Ñ', ':w<CR>', opts)

-- Visual block shifting with indentation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Commands for cycling split selection with the new split screen shell instance
vim.api.nvim_set_keymap('n', '<S-CR>', '<C-w>w', opts)
vim.api.nvim_set_keymap('t', '<S-CR>', '<C-\\><C-n><C-w>w', opts)

-- Remap for auto suggestions (dropdown autocompletion)
vim.api.nvim_set_keymap('i', '<C-S>', '<C-n>', opts)

-- Remap for s acting as an entry to insert mode
vim.api.nvim_set_keymap('n', 's', 'i', { noremap = true })

-- Remap for using option delete for deleting words
vim.api.nvim_set_keymap('i', '<M-BS>', '<C-W>', opts)

-- Remap for clearing search highlighting
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', opts)
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', opts)

-- Terminal remappings for facilitated use
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-N>', opts)
