return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.stylua, -- Lua formatter
        null_ls.builtins.formatting.prettier, -- JS, Ts, HTML, CSS, JSON, Markdown, YAML, etc.
        null_ls.builtins.formatting.black, -- Python formatter
        null_ls.builtins.formatting.isort, -- Python imports sorter
        null_ls.builtins.formatting.rubocop, -- Ruby formatter
        null_ls.builtins.diagnostics.eslint_d, -- JS/TS formatter

        -- Linters
        null_ls.builtins.diagnostics.rubocop, -- Ruby linter
        null_ls.builtins.diagnostics.stylelint, -- CSS linter
      },
    })
  end,
}
