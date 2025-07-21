local M = {} 

M.run_file_command = function()
  local filetype = vim.bo.filetype
  local dir = vim.fn.stdpath('config') .. "/scripts"
  local prefix = "!"

  if filetype == "cpp" then
    program = dir .. "/icpp"
  elseif filetype == "python" then
    program = "python3"
  elseif filetype == "lua" then
    prefix = ""
    program = "source"
  end

  local cmd = string.format(
      ":%s%s %%%s",
      prefix,
      program,
      vim.api.nvim_replace_termcodes("<CR>", true, true, true)
    ) 
  vim.api.nvim_feedkeys(cmd, "n", false)
end

return M
