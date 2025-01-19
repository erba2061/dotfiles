local function set_claude_api_key()
	local file = vim.fn.fnamemodify("~/.claude_api_key", ":p")
	local ok, content = pcall(vim.fn.readfile, file)

	if not (ok and content and content[1]) then
		vim.notify("missing or invalid claude api key", vim.log.levels.WARN)
		return
	end

	vim.g.claude_api_key = content[1]
end

set_claude_api_key()

-- default bindings
-- vim.g.claude_map_implement = "<Leader>ci"
-- vim.g.claude_map_open_chat = "<Leader>cc"
-- vim.g.claude_map_send_chat_message = "<C-]>"
-- vim.g.claude_map_cancel_response = "<Leader>cx"

return {
	{ "pasky/claude.vim", config = function() end },
}
