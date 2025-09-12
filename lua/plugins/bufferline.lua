return {
	"akinsho/bufferline.nvim",
	init = function()
		local bufline = require("catppuccin.groups.integrations.bufferline")
		local original_get = bufline.get
		function bufline.get()
			if bufline.get_theme then
				return bufline.get_theme()
			else
				return original_get()
			end
		end
	end,
}
