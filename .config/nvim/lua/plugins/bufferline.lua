return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "ordinal",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",

				themable = true,
				separator_style = "thin",

				show_buffer_close_icons = true,
				show_close_icon = false,

				always_show_bufferline = false,

				diagnostics = false,
				modified_icon = "●",

				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
		})

		-- Navigation keybinds
		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
		vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

		-- Buffer deletion
		vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

		-- Jump to buffer by number
		for i = 1, 9 do
			vim.keymap.set(
				"n",
				"<leader>" .. i,
				"<cmd>BufferLineGoToBuffer " .. i .. "<cr>",
				{ desc = "Go to buffer " .. i }
			)
		end
		vim.keymap.set("n", "<leader>$", "<cmd>BufferLineGoToBuffer -1<cr>", { desc = "Go to last buffer" })
	end,
}
