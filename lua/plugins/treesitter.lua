return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldlevel = 99
    vim.filetype.add({ extension = { aiy = "python" } })
    vim.filetype.add({ extension = { mdc = "markdown" } })
    configs.setup({
      ensure_installed = {"lua", "cpp", "python", "java", "sql", "markdown", "markdown_inline" },
      highlight = { enable = true },
      indent = { enable = true },
      folds = { enable = true },
    })
  end
}
