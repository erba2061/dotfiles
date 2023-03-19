require("plugins")

vim.opt.clipboard="unnamed"
vim.opt.guicursor=""
vim.opt.backspace="indent,eol,start"
vim.opt.number=true
vim.opt.wrap=false
vim.opt.hidden=true
vim.opt.cursorline=true
vim.opt.scrolloff=6
vim.opt.rnu=true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_skip_check = 1
vim.g.neoformat_try_node_exe = 1
vim.g.mapleader = " "

vim.keymap.set("n", "<SPACE>", "<Nop>")

-- Buffer stuff
vim.keymap.set("n", "<S-e>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-q>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<S-w>", "<cmd>bdelete<CR>")

-- Keybind stuff
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFindFile<CR>")

vim.keymap.set("n", "<leader>ff", "<cmd>require('telescope.builtin').git_files()<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>require('telescope.builtin').live_grep()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>require('telescope.builtin').buffers()<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>require('telescope.builtin').help_tags()<cr>")

require('lualine').setup({
	tabline = {},
})
require("nvim-tree").setup()

local cmp = require('cmp');

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
