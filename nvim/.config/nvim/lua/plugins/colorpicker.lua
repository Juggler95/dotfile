return {
  "uga-rosa/ccc.nvim",
  cmd = { "CccPick", "CccConvert" }, -- load only when needed
  keys = {
    { "<leader>cp", "<cmd>CccPick<cr>", desc = "Pick a color" },
    { "<leader>cc", "<cmd>CccConvert<cr>", desc = "Convert color" },
  },
  config = function()
    local ccc = require("ccc")
    ccc.setup({
      highlighter = {
        auto_enable = true, -- auto highlight colors like colorizer
        lsp = true,
      },
    })
  end,
}
