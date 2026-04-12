return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "master",
		lazy = false,
		config = function()
			-- Neovim 0.12 uses native treesitter highlighting
			-- nvim-treesitter is only needed for parser installation
			local ts = require("nvim-treesitter")

			-- Install parsers
			ts.install({
				"bash",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"templ",
				"tsx",
				"typescript",
				"xml",
				"yaml",
				"jsdoc",
				"json",
				"javascript",
				"regex",
				"go",
			})
		end,
	},
}
