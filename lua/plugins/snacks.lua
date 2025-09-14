local scratch_dir = vim.fn.stdpath("data") .. "/scratch/"
local default_scratch = scratch_dir .. "scratch.md"
local last_scratch = default_scratch

local function get_scratch_files()
	local scratches = {}
	if vim.fn.isdirectory(scratch_dir) == 1 then
		local files = vim.fn.globpath(scratch_dir, "*.md", 0, 1)
		for _, file in ipairs(files) do
			local name = vim.fn.fnamemodify(file, ":t:r")
			table.insert(scratches, name)
		end
	end
	return scratches
end

local function get_scratch_path(name)
	return scratch_dir .. name .. ".md"
end

local function close_scratch_buffers()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) then
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match(vim.pesc(scratch_dir)) then
				local wins = vim.fn.win_findbuf(bufnr)
				for _, winnr in ipairs(wins) do
					vim.api.nvim_win_close(winnr, false)
				end
			end
		end
	end
end

local function open_scratch_buffer(file_path, name)
	close_scratch_buffers()
	last_scratch = file_path
	if name == "scratch" then
		Snacks.scratch()
	else
		Snacks.scratch.open({ file = file_path, name = name })
	end
end

local function is_scratch_buffer_open()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) then
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match(vim.pesc(scratch_dir)) then
				local wins = vim.fn.win_findbuf(bufnr)
				if #wins > 0 then
					return true
				end
			end
		end
	end
	return false
end

local function select_scratch_buffer()
	local scratches = get_scratch_files()
	
	if #scratches == 0 then
		vim.notify("No scratch buffers found")
		return
	end
	
	vim.ui.select(scratches, {
		prompt = "Select scratch buffer:",
		format_item = function(item)
			return item
		end,
	}, function(choice)
		if choice then
			local file_path = get_scratch_path(choice)
			open_scratch_buffer(file_path, choice)
		end
	end)
end

local function create_named_scratch_buffer()
	local name = vim.fn.input("Scratch buffer name: ")
	if name ~= "" then
		vim.fn.mkdir(scratch_dir, "p")
		local file_path = get_scratch_path(name)
		open_scratch_buffer(file_path, name)
	end
end

local function toggle_scratch_buffer()
	if is_scratch_buffer_open() then
		close_scratch_buffers()
	else
		local name = vim.fn.fnamemodify(last_scratch, ":t:r")
		open_scratch_buffer(last_scratch, name)
	end
end

return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		scratch = {
			ft = "markdown",
			file = default_scratch,
		},
	},
	keys = {
		{
			"<leader>'",
			select_scratch_buffer,
			desc = "Select Scratch Buffer",
		},
		{
			'<leader>"',
			create_named_scratch_buffer,
			desc = "Create Named Scratch Buffer",
		},
		{
			"<leader>.",
			toggle_scratch_buffer,
			desc = "Toggle Scratch Buffer",
		},
	},
}
