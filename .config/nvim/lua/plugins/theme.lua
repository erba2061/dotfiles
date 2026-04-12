return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		init = function()
			require("gruvbox").setup({
				contrast = "hard", -- matches Ghostty's "Gruvbox Dark Hard"
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
			})
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
