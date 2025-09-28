local function pick_nearest_dir()
	local picker = Snacks.picker.get({ source = "explorer" })[1]
	local item = picker:current()
	return vim.fn.isdirectory(item.file) == 1 and item.file or vim.fn.fnamemodify(item.file, ":h")
end

local function change_dir(dir)
	vim.cmd("cd " .. vim.fn.fnameescape(dir))
	vim.cmd("lcd " .. vim.fn.fnameescape(dir))
end

local function open_explorer_at(dir)
	if dir then
		change_dir(dir)
	end
	Snacks.explorer()
end

local function explorer_parent_dir()
	open_explorer_at(vim.fn.expand("%:p:h"))
end

local function explorer_git_root()
	open_explorer_at(require("config.util").GitRoot())
end

local function explorer_search()
	local dir = pick_nearest_dir()
	Snacks.picker.files({ cwd = dir })
end

local function explorer_cd_to_focused()
	local dir = pick_nearest_dir()
	change_dir(dir)
end

local function explorer_cd_parent()
	local parent_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":h")
	change_dir(parent_dir)
end

return {
	"folke/snacks.nvim",
	keys = {
		{ "<leader>e", explorer_git_root, desc = "Explorer (Git Root)" },
		{ "<leader>E", explorer_parent_dir, desc = "Explorer (Parent Dir)" },
	},
	opts = {
		picker = {
			sources = {
				explorer = {
					layout = {
						hidden = { "input" }, -- Hide the search input bar for explorer only
					},
					win = {
						list = {
							keys = {
								["/"] = explorer_search,
								["."] = explorer_cd_to_focused,
								["<BS>"] = explorer_cd_parent,
							},
						},
					},
				},
			},
		},
	},
}
