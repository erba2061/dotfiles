return {
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		init = function()
			require("onedark").setup({
				style = "dark", -- Options: dark, darker, cool, deep, warm, warmer
				transparent = false,
				term_colors = true,
				code_style = {
					comments = "none",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},
			})
			require("onedark").load()
		end,
	},
}
