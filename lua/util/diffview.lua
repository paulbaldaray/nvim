local M = {}

local last_commit = false

local function close_if_open()
	if next(require("diffview.lib").views) ~= nil then
		vim.cmd("DiffviewClose")
		return true
	end
	return false
end

function M.view()
	if close_if_open() then
		return
	end
	if last_commit then
		vim.cmd("DiffviewOpen " .. last_commit)
	else
		vim.cmd("DiffviewOpen")
	end
end

function M.history()
	if close_if_open() then
		return
	end
	local current_file = vim.fn.expand("%")
	if current_file == "" then
		vim.notify("No file in current buffer", vim.log.levels.WARN)
		return
	end
	vim.cmd("DiffviewFileHistory " .. current_file)
end

function M.select()
	if close_if_open() then
		return
	end

	-- Get recent commits with hash and title
	local git_cmd = "git log --oneline -50 --pretty=format:'%h|%s'"
	local output = vim.fn.system(git_cmd)

	if vim.v.shell_error ~= 0 then
		vim.notify("Error getting git commits", vim.log.levels.ERROR)
		return
	end

	local commits = { "━━ View Staged/Unstaged ━━" }
	local commit_hashes = { false }

	for line in output:gmatch("[^\n]+") do
		local hash, title = line:match("^([a-f0-9]+)|(.+)")
		if hash and title then
			table.insert(commits, title)
			table.insert(commit_hashes, hash)
		end
	end

	vim.ui.select(commits, { prompt = "Diff with commit:" }, function(choice, idx)
		if choice and idx then
			last_commit = commit_hashes[idx]
			M.view()
		end
	end)
end

return M
