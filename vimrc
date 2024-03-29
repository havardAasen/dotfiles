" map leader to comma
let mapleader = ","

" Switch buffers using ctrl+left or ctrl+right
map <C-left> <ESC>:bp<CR>
map <C-right> <ESC>:bn<CR>

" Plugins
call plug#begin()

Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

"Plug 'scrooloose/nerdtree'

call plug#end()

" LaTeX
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" YouCompleteMe - installed with apt.
packadd youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
  \   'c,cpp,objc': [ 're!\w{3}', '_' ],
  \ }
let g:ycm_add_preview_to_completeopt='popup'
let g:ycm_autoclose_preview_window_after_completion=1

" Spelling
" Default locale is en_us
" Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <leader>S :call ToggleSpellCheck()<CR>

" Color
syntax enable
" Needed for tmux
set background=dark
set t_Co=256

" Spaces & Tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype indent on
filetype plugin on

" UI layout
set showcmd
set wildmenu
set number relativenumber
set scrolloff=8
set sidescrolloff=8
" vim-airline (statusbar)
set ttimeoutlen=10
set noshowmode
" Highlight columns
"highlight colorcolumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v.', '\+')
"set colorcolumn=100

" Automatically resize panes
autocmd VimResized * execute "normal! \<c-w>="

" Set document title to window title
set title

" Enable mouse usage (all modes)
set mouse=a

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" File find
set path+=**
set wildmenu

" Create group to match bad whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

" Automatically save before commands like :next and :make
set autowrite

" turn swap and viminfo files off
set nobackup
set writebackup
set noswapfile
set viminfofile=NONE

" Enable folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

""inoremap " ""<left>
""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>O
