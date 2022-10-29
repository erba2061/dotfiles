call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'
Plug 'editorconfig/editorconfig-vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

" Plug 'scrooloose/nerdtree'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rust-lang/rust.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'ncm2/float-preview.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
call plug#end()

lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

lua require("nvim-tree").setup()

" Vim specific options
set backspace=indent,eol,start
set number
set nowrap
set hidden
set cursorline
set clipboard=unnamed
set t_Co=256

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

syntax enable
filetype plugin indent on

" Airline configurations
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts=1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Autocomplete related
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview

let g:python3_host_skip_check = 1

let g:float_preview#docked = 0

" NERDtree options
" let NERDTreeMinimalUI=1
" let NERDTreeShowHidden=1
" let NERDTreeIgnore=['\.git$']

" let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
" let g:NERDTreeGitStatusShowClean = 1

" let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
" let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
" let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:neoformat_try_node_exe = 1

augroup formatior 
  autocmd!
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.jsx Neoformat
  autocmd BufWritePre *.less Neoformat
augroup END

" Startup options
" autocmd VimEnter * :NERDTree
" autocmd VimEnter * wincmd p

" Buffer stuff
set hidden
nnoremap <C-e> :bnext<CR>
nnoremap <C-q> :bprev<CR>
nnoremap <C-r> :bdelete<CR>

" Keybind stuff
nnoremap <C-p> :LspDefinition<CR>
nnoremap <C-i> :LspReferences<CR>
nnoremap <C-g> :Ag<CR>
nnoremap <C-f> :GFiles<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>

colorscheme nightfox
