local scratch_dir = vim.fn.stdpath("data") .. "/scratch/"
local last_scratch = "scratch"

local function get_scratch_files()
	local files = vim.fn.globpath(scratch_dir, "*.md", 0, 1)
	local scratches = {}
	for _, file in ipairs(files) do
		table.insert(scratches, vim.fn.fnamemodify(file, ":t:r"))
	end
	return scratches
end

local function get_scratch_path(name)
	return scratch_dir .. name .. ".md"
end

local function open_scratch(name)
	last_scratch = name
	Snacks.scratch.open({ file = get_scratch_path(name), name = name, ft = "markdown" })
end

local function is_scratch_focused()
	local bufname = vim.api.nvim_buf_get_name(0)
	return bufname:match(vim.pesc(scratch_dir)) ~= nil
end

local function scratch_menu()
	local scratches = get_scratch_files()
	local items = vim.list_extend({}, scratches)
	table.insert(items, "+ Create New")
	table.insert(items, "- Delete")
	
	vim.ui.select(items, { prompt = "Scratch:" }, function(choice)
		if not choice then return end
		
		if choice == "+ Create New" then
			local name = vim.fn.input("Name: ")
			if name ~= "" then open_scratch(name) end
		elseif choice == "- Delete" then
			vim.ui.select(scratches, { prompt = "Delete:" }, function(name)
				if not name then return end
				vim.fn.delete(get_scratch_path(name))
				vim.notify("Deleted: " .. name)
			end)
		else
			open_scratch(choice)
		end
	end)
end

local function toggle_scratch()
	if is_scratch_focused() then
		Snacks.scratch.close()
	else
		open_scratch(last_scratch)
	end
end

return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		scratch = {
			win = {
				width = 0.5,
				height = 0.5,
				zindex = 1000,
			},
		},
	},
	keys = {
		{
			"<leader>'",
			toggle_scratch,
			desc = "Toggle Scratch Buffer",
			mode = { "n", "x", "t" },
		},
		{
			'<leader>"',
			scratch_menu,
			desc = "Scratch Buffer Menu",
			mode = { "n", "x", "t" },
		},
	},
}
