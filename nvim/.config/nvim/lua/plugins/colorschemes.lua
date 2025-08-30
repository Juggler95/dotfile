
return {
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,  -- load on demand
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end,
  },

  -- Cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    lazy = true,  -- load on demand
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("cyberdream").setup(opts)
    end,
  },

  -- Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,  -- load on demand
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",          -- storm, night, day, moon
        transparent = true,      -- change to true if you want transparency
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          functions = {},
          variables = {},
          numbers = {},
        },
      })
    end,
  },
}
