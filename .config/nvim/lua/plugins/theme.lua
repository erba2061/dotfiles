return {
	{
		"rose-pine/neovim",
		init = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
