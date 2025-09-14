return {
  -- "Surround" ys
  { "tpope/vim-surround" },

  --{} Autoclose
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup()
    end,
  },
  -- Comment gcc
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Colorizer #000000
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre", -- load when opening a buffer
    config = function()
      require("colorizer").setup({
        filetypes = { "*" }, -- enable for all filetypes
        user_default_options = {
          RGB = true,    -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = false, -- "Blue" or "Red"
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = true, -- 0xAARRGGBB hex codes
          rgb_fn = true, -- CSS rgb() and rgba()
          hsl_fn = true, -- CSS hsl() and hsla()
          css = true,    -- Enable all CSS features
          css_fn = true, -- Enable all CSS *functions*
        },
      })
    end,
  },

  -- Color Picker cp cc
  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick", "CccConvert" }, -- load only when needed
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>",    desc = "Pick a color" },
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
  },

-- ufo folds zo, zc, za
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },

    init = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,

    config = function()
      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      require("ufo").setup({
        provider_selector = function(_, _, _)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
