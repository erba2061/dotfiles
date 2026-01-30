vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Git

vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Git diff current file" })
vim.keymap.set("n", "<leader>gl", function()
	local name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
	vim.cmd(string.format("G log --pretty=oneline %s", name))
end, { desc = "Git diff current file" })

vim.keymap.set("n", "M", function()
	vim.cmd("vert Man " .. vim.fn.expand("<cword>"))
end, { desc = "Manpage <cword>" })

vim.keymap.set("n", "<leader>cp", function()
	local full_path = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local rel_path = vim.fn.fnamemodify(full_path, ":." .. cwd)
	vim.fn.setreg("+", rel_path)
end, { desc = "Copy file path" })

vim.keymap.set("n", "<leader>fb", "<cmd>Neotree float reveal_force_cwd<cr>", { desc = "[F]ind [B]rowser" })
vim.keymap.set("n", "\\", "<cmd>Neotree float reveal_force_cwd<cr>", { desc = "[F]ind [B]rowser" })

-- Jumplist navigation by file (skip entries in same file)
local function jump_to_prev_file()
	local jumplist, current_pos = unpack(vim.fn.getjumplist())
	local current_bufnr = vim.api.nvim_get_current_buf()

	for i = current_pos, 1, -1 do
		local entry = jumplist[i]
		if entry.bufnr ~= current_bufnr and vim.api.nvim_buf_is_valid(entry.bufnr) then
			local jumps_needed = current_pos - i + 1
			local jump_cmd = vim.api.nvim_replace_termcodes("normal! " .. jumps_needed .. "<C-o>", true, false, true)
			vim.cmd(jump_cmd)
			return
		end
	end
end

local function jump_to_next_file()
	local jumplist, current_pos = unpack(vim.fn.getjumplist())
	local current_bufnr = vim.api.nvim_get_current_buf()

	for i = current_pos + 2, #jumplist do
		local entry = jumplist[i]
		if entry.bufnr ~= current_bufnr and vim.api.nvim_buf_is_valid(entry.bufnr) then
			local jumps_needed = i - current_pos - 1
			local jump_cmd = vim.api.nvim_replace_termcodes("normal! " .. jumps_needed .. "<C-i>", true, false, true)
			vim.cmd(jump_cmd)
			return
		end
	end
end

vim.keymap.set("n", "<C-S-o>", jump_to_prev_file, { desc = "Jump to previous file in jumplist" })
vim.keymap.set("n", "<C-S-i>", jump_to_next_file, { desc = "Jump to next file in jumplist" })
