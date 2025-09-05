return {
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      picker = {
        files = {
          hidden = true,  -- show hidden files
          ignored = true, -- show files ignored by gitignore
        },
      },
    },
  },
}
