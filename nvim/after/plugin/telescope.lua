local builtin = require('telescope.builtin')

-- Open telescope navigator
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
--
-- -- Remap <C-g> to the Telescope command with custom layout_config
-- vim.keymap.set('n', '<C-y>', function()
--   require('telescope.builtin').lsp_document_symbols({
--     layout_config = { width = 75, height = 15 }
--   })
-- end, { noremap = true, silent = true })
--
vim.keymap.set('n', '<leader><leader>', function()
  require('telescope.builtin').lsp_document_symbols({
    layout_strategy = 'horizontal',
    layout_config = {
      anchor = 'NE', -- North-East (Top-Right)
      width = 75,   -- 50% of the screen width
      height = 15,  -- 30% of the screen height
      preview_width = 0.5 -- Adjust as needed for the preview section
    },
    border = true,   -- Optional: add a border
  })
end, { noremap = true, silent = true })

require('telescope').load_extension('fzy_native')
