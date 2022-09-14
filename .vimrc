call plug#begin('~/.vim/plugged')
Plug 'sbdchd/neoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/tagbar'

Plug 'rust-lang/rust.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'ncm2/float-preview.nvim'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

" Vim specific options
set backspace=indent,eol,start
set number
set nowrap
set hidden
set cursorline
set clipboard=unnamed

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

"let g:deoplete#enable_at_startup = 1

"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#pointer = 1
"let g:deoplete#sources#go#builtin_objects = 1
"let g:deoplete#sources#go#unimported_packages = 1
"let g:deoplete#sources#go#source_importer = 1

"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#use_cache = 1

let g:float_preview#docked = 0

"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" NERDtree options
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
"let g:NERDTreeGitStatusShowClean = 1

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:neoformat_try_node_exe = 1

autocmd BufWritePre *.js Neoformat
" Startup options
autocmd VimEnter * :NERDTree
autocmd VimEnter * wincmd p

" Buffer stuff
set hidden
nnoremap <C-e> :bnext<CR>
nnoremap <C-q> :bprev<CR>

" Keybind stuff
nnoremap <C-p> :LspDefinition<CR>
nnoremap <C-i> :LspReferences<CR>
nnoremap <C-g> :Ag<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

set t_Co=256

colorscheme nightfox
