local M = {}

function M.GitRoot()
	local git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	if git_dir == "" then
		return nil
	end
	return vim.fn.fnamemodify(git_dir, ":h")
end

function M.ensure_binary(config)
	if vim.fn.executable(config.name) == 1 then
		vim.notify(config.name .. " is already installed", vim.log.levels.INFO)
		return
	end

	local os_name = vim.fn.system("uname -s"):gsub("\n", "")
	if os_name ~= "Linux" then
		vim.notify(config.name .. " auto-install only supported on Linux", vim.log.levels.WARN)
		return
	end

	local arch = vim.fn.system("uname -m"):gsub("\n", "")
	local target = config.targets[arch]
	if not target then
		vim.notify(config.name .. " not available for architecture: " .. arch, vim.log.levels.WARN)
		return
	end

	vim.notify("Installing " .. config.name .. "...", vim.log.levels.INFO)

	local tmp_dir = "/tmp/" .. config.name .. "_install_" .. os.time()
	local local_bin = vim.fn.expand("~/.local/bin")
	local filename = config.name .. "-" .. config.version .. "-" .. target .. ".tar.gz"
	local url = "https://github.com/" .. config.repo .. "/releases/download/" .. config.version .. "/" .. filename

	local commands = {
		"mkdir -p " .. tmp_dir .. " " .. local_bin,
		"cd " .. tmp_dir .. " && wget -q " .. url,
		"cd " .. tmp_dir .. " && tar -xzf *.tar.gz",
		"cd " .. tmp_dir .. " && cp " .. config.archive_path .. " " .. local_bin .. "/" .. config.name,
		"chmod +x " .. local_bin .. "/" .. config.name,
		"rm -rf " .. tmp_dir,
	}

	for _, cmd in ipairs(commands) do
		if os.execute(cmd .. " 2>/dev/null") ~= 0 then
			os.execute("rm -rf " .. tmp_dir)
			vim.notify("Failed to install " .. config.name, vim.log.levels.ERROR)
			return
		end
	end

	if vim.fn.executable(config.name) == 1 then
		vim.notify(config.name .. " installed successfully!", vim.log.levels.INFO)
	else
		vim.notify("Installation completed but " .. config.name .. " not found in PATH", vim.log.levels.WARN)
	end
end

return M
