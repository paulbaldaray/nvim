return {
	-- Import lang.yaml from LazyExtras
	{ import = "lazyvim.plugins.extras.lang.yaml" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "yaml" })
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = function()
			-- Set up filetype detection for .yapl files
			vim.filetype.add({
				extension = {
					yapl = "yaml",
				},
			})

			-- Set up autocmds for YAPL files
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.yapl",
				callback = function()
					vim.bo.filetype = "yaml"
					vim.bo.commentstring = "# %s"
					vim.bo.tabstop = 2
					vim.bo.shiftwidth = 2
					vim.bo.expandtab = true

					-- Use matchadd for highlighting instead of syntax
					vim.defer_fn(function()
						-- Define highlight groups
						vim.api.nvim_set_hl(0, "YaplKeywordType", { fg = "#cba6f7", bold = true })
						vim.api.nvim_set_hl(0, "YaplKeywordLet", { fg = "#cba6f7", bold = true })
						vim.api.nvim_set_hl(0, "YaplKeywordInclude", { fg = "#cba6f7", bold = true })
						vim.api.nvim_set_hl(0, "YaplKeywordImport", { fg = "#cba6f7", bold = true })
						vim.api.nvim_set_hl(0, "YaplKeywordFor", { fg = "#cba6f7", bold = true })
						vim.api.nvim_set_hl(0, "YaplVariable", { fg = "#fab387" })

						-- Add matches
						vim.fn.matchadd("YaplKeywordType", "^\\s*\\zsyapl\\ze\\s*:")
						vim.fn.matchadd("YaplKeywordLet", "^\\s*\\zslet\\ze\\s*:")
						vim.fn.matchadd("YaplKeywordInclude", "^\\s*\\zsinclude\\ze\\s*:")
						vim.fn.matchadd("YaplKeywordImport", "^\\s*\\zsimport\\ze\\s*:")
						vim.fn.matchadd("YaplKeywordFor", "^\\s*-\\?\\s*\\zsfor\\ze\\s\\+\\w\\+\\s\\+in\\s")
						vim.fn.matchadd("YaplVariable", "<[a-zA-Z_][a-zA-Z0-9_]*\\(::[a-zA-Z_][a-zA-Z0-9_]*\\)*>")
					end, 200)
				end,
			})
		end,
	},
}
