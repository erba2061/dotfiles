return {
	"akinsho/toggleterm.nvim",
	config = function()
		local term = require("toggleterm")
		term.setup()

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			hidden = true,
		})

		vim.keymap.set("n", "<leader>gg", function()
			lazygit:toggle()
		end, { desc = "Open Lazygit" })
	end,
}
