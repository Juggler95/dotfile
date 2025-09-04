return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre", -- load when opening a buffer
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- enable for all filetypes
      user_default_options = {
        RGB      = true,  -- #RGB hex codes
        RRGGBB   = true,  -- #RRGGBB hex codes
        names    = false, -- "Blue" or "Red"
        RRGGBBAA = true,  -- #RRGGBBAA hex codes
        AARRGGBB = true,  -- 0xAARRGGBB hex codes
        rgb_fn   = true,  -- CSS rgb() and rgba()
        hsl_fn   = true,  -- CSS hsl() and hsla()
        css      = true,  -- Enable all CSS features
        css_fn   = true,  -- Enable all CSS *functions*
      },
    })
  end,
}
