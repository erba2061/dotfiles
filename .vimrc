call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'rust-lang/rust.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'vim-airline/vim-airline'
Plug 'EdenEast/nightfox.nvim'
Plug 'rose-pine/neovim'

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
call plug#end()

" Vim specific options
set guicursor=""
set backspace=indent,eol,start
set number
set nowrap
set hidden
set cursorline
set clipboard=unnamed
set t_Co=256
set scrolloff=6
set rnu

syntax enable
filetype plugin indent on

" Airline configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1

let g:python3_host_skip_check = 1

let g:float_preview#docked = 0

let g:neoformat_try_node_exe = 1

augroup formatior 
  autocmd!
  autocmd BufWritePre *.rs RustFmt
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.jsx Neoformat
  autocmd BufWritePre *.less Neoformat
augroup END

nnoremap <SPACE> <Nop>
let mapleader = " "

" Buffer stuff
set hidden
nnoremap <S-e> :bnext<CR>
nnoremap <S-q> :bprev<CR>
nnoremap <S-w> :bdelete<CR>

" Keybind stuff
nnoremap <C-s> :w<CR>
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" colorscheme nightfox
colorscheme rose-pine

set completeopt=menu,menuone,noselect

lua <<EOF
--  local opts = { noremap=true, silent=true }
--  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
--  local on_attach = function(client, bufnr)
--    -- Mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local bufopts = { noremap=true, silent=true, buffer=bufnr }
--    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
--    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
--  end

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup()

  local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
  })

  -- (Optional) Configure lua language server for neovim
  lsp.nvim_workspace()

  lsp.setup()

  -- TODO: Cli suggestions

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
EOF
