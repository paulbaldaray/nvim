return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-h>", ":TmuxNavigateLeft<CR>" },
    { "<C-j>", ":TmuxNavigateDown<CR>" },
    { "<C-k>", ":TmuxNavigateUp<CR>" },
    { "<C-l>", ":TmuxNavigateRight<CR>" },
    { "<C-\\>", ":TmuxNavigatePrevious<CR>" },
  }
}
