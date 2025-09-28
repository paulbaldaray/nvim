local function toggle_diffview()
  if next(require('diffview.lib').views) ~= nil then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end

local function toggle_file_history()
  if next(require('diffview.lib').views) ~= nil then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewFileHistory")
  end
end

local function toggle_compare_prompt()
  if next(require('diffview.lib').views) ~= nil then
    vim.cmd("DiffviewClose")
  else
    vim.ui.input({ prompt = "Diff with: ", default = "HEAD~1" }, function(input)
      if input then
        vim.cmd("DiffviewOpen " .. input)
      end
    end)
  end
end

return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader>gg", toggle_diffview, desc = "Toggle Diffview" },
    { "<leader>gh", toggle_file_history, desc = "Toggle File History" },
    { "<leader>gG", toggle_compare_prompt, desc = "Toggle Compare with..." },
  },
  opts = {
    enhanced_diff_hl = true,
  },
}
