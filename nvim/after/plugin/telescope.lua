local builtin = require('telescope.builtin')

-- Open telescope navigator
vim.keymap.set('n', '<C-f>', builtin.find_files, {})

require('telescope').load_extension('fzy_native')
