local find = require("lib.find")

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
		local state = require("telescope.state")
		local actions = require("telescope.actions.state")
		local builtin = require("telescope.builtin")

		ts.setup({
			defaults = {
				cache_picker = {
					num_pickers = 4,
				},
				layout_strategy = "horizontal",
				layout_config = {
					height = function(_, max)
						return max
					end,
					width = function(_, max)
						return max
					end,
				},
				vimgrep_arguments = vim.list_extend(
					{ unpack(ts_config.values.vimgrep_arguments) },
					{ "--hidden", "--glob", "!**/.git/*" }
				),
				preview = {
					filesize_limit = 0.1,
				},
			},
			pickers = {
				find_files = {
					previewer = false,
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

		---@type table<string, string>
		local picker_index = {}

		local update_picker_index = function(picker_id)
			local curr_picker = actions.get_current_picker(vim.api.nvim_get_current_buf())
			picker_index[picker_id] = curr_picker.prompt_title
		end

		---@param picker_id string
		local new_cached_picker = function(picker_id)
			assert(type(builtin[picker_id]) == "function", "Builtin picker not found: " .. picker_id)
			return function()
				local cached_pickers = state.get_global_key("cached_pickers") or {}
				local cache_index = find(cached_pickers, function(cached)
					return cached.prompt_title == picker_index[picker_id]
				end)
				if cache_index then
					return builtin.resume({ cache_index = cache_index })
				end

				builtin[picker_id]()
				update_picker_index(picker_id)
			end
		end

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>rf", new_cached_picker("find_files"), { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>rg", new_cached_picker("live_grep"), { desc = "[F]ind by [G]rep" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	end,
}
