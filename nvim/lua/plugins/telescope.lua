return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local ts = require("telescope")
		local ts_config = require("telescope.config")
		local ts_builtin = require("telescope.builtin")
		local vimgrep_arguments = vim.tbl_extend(
			"force",
			{ unpack(ts_config.values.vimgrep_arguments) },
			{ "--hidden", "--glob", "!**/.git/*" }
		)

		ts.setup({
			defautls = {
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true,
				},
			},
		})

		pcall(ts.load_extension, "fzf")

		vim.keymap.set("n", "<leader>fh", ts_builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>ff", ts_builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fg", ts_builtin.live_grep, { desc = "[F]ind by [G]rep" })
		vim.keymap.set("n", "<leader>fd", ts_builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>fr", ts_builtin.resume, { desc = "[F]ind [R]esume" })
		vim.keymap.set("n", "<leader>f.", ts_builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", ts_builtin.buffers, { desc = "[ ] Find existing buffers" })
	end,
}
