return {
	"akinsho/toggleterm.nvim",
	config = function()
		local term = require("toggleterm")
		term.setup()

		vim.keymap.set(
			"n",
			"<leader>gg",
			"<cmd>TermExec direction=float name=term_lazygit cmd=lazygit<cr>",
			{ desc = "Go to previous [D]iagnostic message" }
		)
	end,
}
