local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Add a file to the harpoon index
vim.keymap.set("n", "<leader>a", mark.add_file)

-- Opens the harpoon UI
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- Harpoon quick file change remaps
vim.keymap.set("n", "<C-z>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-x>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(3) end)
