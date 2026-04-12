return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
	-- Neovim 0.12 has native markdown highlighting enabled by default
	-- This plugin may have compatibility issues - disable if errors occur
	enabled = false,
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
}
