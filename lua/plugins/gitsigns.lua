return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>gb", function() require("util.gitsigns").toggle_blame() end, desc = "Toggle Git Blame Buffer" },
  },
}
