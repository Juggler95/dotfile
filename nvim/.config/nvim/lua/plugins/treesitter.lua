return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- load on startup
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "css", "html", "javascript", "lua" }, -- add the languages you want
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
