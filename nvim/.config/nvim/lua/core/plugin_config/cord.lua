-- lua/core/plugin_config/cord.lua
local M = {}

function M.setup()
    local cord = require("cord")

    cord.setup({
        auto_start = true,    -- automatically start Cord on launch
        highlight = true,     -- highlight active buffer
        notify = true,        -- show notifications
        exclude_filetypes = { "NvimTree", "TelescopePrompt" },
        buffer_close_command = "bdelete",  -- command to close buffers
    })

    -- Keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>c", cord.toggle, opts)          -- toggle cord
    vim.keymap.set("n", "<leader>n", cord.next, opts)            -- next buffer
    vim.keymap.set("n", "<leader>p", cord.previous, opts)        -- previous buffer
    vim.keymap.set("n", "<leader>bc", cord.close_current, opts)  -- close current buffer
end

return M

