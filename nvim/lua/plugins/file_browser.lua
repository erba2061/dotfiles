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
		})
		vim.keymap.set("n", "<leader>fb", "<cmd>Neotree current reveal_force_cwd<cr>", { desc = "[F]ind [B]rowser" })
	end,
}
