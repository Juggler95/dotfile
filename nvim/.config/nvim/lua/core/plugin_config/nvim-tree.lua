vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

-- Toggle tree
vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

-- Jump focus into the tree
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', {silent = true})
