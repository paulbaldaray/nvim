return {
  "NeogitOrg/neogit",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "folke/snacks.nvim",
  },
  keys = {
    {
      "<leader>gg",
      function()
        local neogit_win_found = false
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local bufnr = vim.api.nvim_win_get_buf(win)
          if vim.bo[bufnr].filetype == "NeogitStatus" then
            vim.api.nvim_win_close(win, false)
            neogit_win_found = true
            break
          end
        end

        if not neogit_win_found then
          require("neogit").open({ cwd = vim.fn.expand("%:p:h"), kind = "floating" })
        end
      end,
      desc = "Toggle Neogit Float", -- Updated description
    },
  },
  config = true,
}
