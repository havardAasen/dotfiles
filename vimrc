" map leader to comma
let mapleader = ","

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Latex-Suite-aka-Vim-Latex'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'

"Plugin 'scrooloose/nerdtree'

call vundle#end()

" LaTeX
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'atril'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
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
set tabstop=4
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
" vim-airline (statusbar)
set ttimeoutlen=10
set noshowmode
" Highlight columns
highlight colorcolumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v.', '\+')
set colorcolumn=100

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" swap and backup files
set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Create group to match bad whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/
