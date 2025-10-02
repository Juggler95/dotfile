vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")

-- TELESCOPE
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- Neo-tree
-- vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>")
-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left <CR>")

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Undo tree
-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- vim.keymap.set("n", "<leader>f", vim.cmd.UndotreeFocus)

-- None-ls formatting
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Live server
vim.keymap.set("n", "<leader>l", ":LiveServerStart<CR>")
vim.keymap.set("n", "<leader>x", ":LiveServerStop<CR>")
