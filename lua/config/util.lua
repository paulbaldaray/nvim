local M = {}

function M.GitRoot()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	if git_dir == "" then
		return nil
	end
	return vim.fn.fnamemodify(git_dir, ":h")
end

return M
