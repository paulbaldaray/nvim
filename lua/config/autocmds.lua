-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "yaml", "markdown" },
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.expandtab = true

		vim.defer_fn(function()
			vim.api.nvim_set_hl(0, "YaplKeywordType", { fg = "#cba6f7", bold = true })
			vim.api.nvim_set_hl(0, "YaplKeywordLet", { fg = "#cba6f7", bold = true })
			vim.api.nvim_set_hl(0, "YaplKeywordInclude", { fg = "#cba6f7", bold = true })
			vim.api.nvim_set_hl(0, "YaplKeywordImport", { fg = "#cba6f7", bold = true })
			vim.api.nvim_set_hl(0, "YaplKeywordFor", { fg = "#cba6f7", bold = true })
			vim.api.nvim_set_hl(0, "YaplVariable", { fg = "#fab387" })
			vim.fn.matchadd("YaplKeywordType", "^\\s*\\zsyapl\\ze\\s*:")
			vim.fn.matchadd("YaplKeywordLet", "^\\s*\\zslet\\ze\\s*:")
			vim.fn.matchadd("YaplKeywordInclude", "^\\s*\\zsinclude\\ze\\s*:")
			vim.fn.matchadd("YaplKeywordImport", "^\\s*\\zsimport\\ze\\s*:")
			vim.fn.matchadd("YaplKeywordFor", "^\\s*-\\?\\s*\\zsfor\\ze\\s\\+\\w\\+\\s\\+in\\s")
			vim.fn.matchadd("YaplVariable", "<[a-zA-Z_][a-zA-Z0-9_]*\\(::[a-zA-Z_][a-zA-Z0-9_]*\\)*>")
		end, 200)
	end,
})
