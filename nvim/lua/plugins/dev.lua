return {
	{
		dir = "~/github/slideshow.nvim",
		config = function()
			local slideshow = require("slideshow")
			vim.keymap.set("n", "<F5>", function()
				slideshow.present()
			end)
		end,
	},
}
