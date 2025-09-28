local function toggle_git_diff()
  -- Check if there's already a diff view
  local diff_wins = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match("^fugitive://") then
      table.insert(diff_wins, win)
    end
  end
  if #diff_wins > 0 then
    for _, win in ipairs(diff_wins) do
      vim.api.nvim_win_close(win, false)
    end
    return
  end
  vim.cmd("Gdiff")
end

local function toggle_git_blame()
  -- Check if we're in a fugitive blame buffer
  if vim.bo.filetype == "fugitiveblame" then
    vim.cmd("q")
    return
  end
  vim.cmd("Git blame")
end

return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gd", toggle_git_diff, desc = "Toggle Git Diff" },
    { "<leader>gb", toggle_git_blame, desc = "Toggle Git Blame" },
  },
}
