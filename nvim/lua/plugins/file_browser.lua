return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local builtin = require("neo-tree")
		builtin.setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
					hide_by_name = {
						".git",
					},
				},
				use_libuv_file_watcher = true,
			},

			window = {
				popup = {
					size = {
						height = "100%",
						width = "100%",
					},
				},
			},
		})
	end,
}
