return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gd", require("util.fugitive").diff, desc = "Toggle Git Diff" },
    { "<leader>gb", require("util.fugitive").blame, desc = "Toggle Git Blame" },
  },
}
