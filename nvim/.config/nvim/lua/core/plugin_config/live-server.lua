-- Setup live-server
local live_server = require("live-server")

live_server.setup({
  port = 5500,          -- default port
  browser_command = "",  -- leave empty for system default browser
  quiet = false,
})

-- Keymaps to control live-server
vim.keymap.set('n', '<C-l>', ":LiveServerStart<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<C-x>', ":LiveServerStop<CR>", { noremap = true, silent = true })

