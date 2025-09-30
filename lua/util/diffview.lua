local M = {}

local function close_if_open()
	if next(require('diffview.lib').views) ~= nil then
		vim.cmd("DiffviewClose")
		return true
	end
	return false
end

function M.toggle()
	if close_if_open() then return end
	vim.cmd("DiffviewOpen")
end

function M.history()
	if close_if_open() then return end
	vim.cmd("DiffviewFileHistory")
end

function M.compare()
	if close_if_open() then return end
	vim.ui.input({ prompt = "Diff with: ", default = "HEAD~1" }, function(input)
		if input then
			vim.cmd("DiffviewOpen " .. input)
		end
	end)
end

return M