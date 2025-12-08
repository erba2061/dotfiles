return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "auto",
			styles = {
				italic = false,
			},
		})

		vim.cmd("colorscheme rose-pine")
	end,
}
