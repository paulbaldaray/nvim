local M = {}

function M.git_root()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	if git_dir == "" then
		return nil
	end
	return vim.fn.fnamemodify(git_dir, ":h")
end

function M.copy_absolute_path()
	local yanked_text = vim.fn.expand("%:p")
	vim.fn.setreg("+", yanked_text)
	vim.notify("Yanked: " .. yanked_text, vim.log.levels.INFO)
end

function M.copy_git_relative_path()
	local full_path = vim.api.nvim_buf_get_name(0)
	local git_root = M.git_root()
	if git_root then
		local rel_path = vim.fn.fnamemodify(full_path, ":." .. git_root)
		vim.fn.setreg("+", rel_path)
		vim.notify("Yanked: " .. rel_path, vim.log.levels.INFO)
	else
		M.copy_absolute_path()
	end
end

return M