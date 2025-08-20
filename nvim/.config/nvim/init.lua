require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

--vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' }) -- For non-current windows
--vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' }) -- For the tilde area
 
-- themes: https://dotfyle.com/neovim/colorscheme/trending
require('cyberdream').setup({
  transparent = true,
  -- other options
})
vim.cmd('colorscheme cyberdream')

