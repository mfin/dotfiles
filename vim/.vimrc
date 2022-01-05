let g:mapleader = "\<Space>"

set laststatus=2
set nocp
set number
set cursorline
set encoding=utf8
set ffs=unix,dos,mac
set nocompatible
set mouse=a
filetype off
syntax on
set foldmethod=indent
set foldlevel=99

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
call plug#end()

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undo_dir = expand('$HOME/.vim/undo_dir')
    if !isdirectory(undo_dir)
        call mkdir(undo_dir, "", 0700)
    endif
    set undodir=$HOME/.vim/undo_dir
    set undofile
endif

hi User1 ctermfg=white ctermbg=black guifg=white guibg=black
hi LineNr ctermfg=darkgray guifg=darkgray
hi CursorLine cterm=NONE ctermbg=black guibg=black
hi ALEErrorSign ctermfg=red ctermbg=NONE guifg=red guibg=NONE
hi ALEWarningSign ctermfg=yellow ctermbg=NONE guifg=yellow guibg=NONE

hi User1 ctermfg=white ctermbg=black guifg=white guibg=black

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%1*%{&ff}%*            "file format
set statusline +=%1*%y%*                "file type
set statusline +=%1*\ %<%F%*            "full path
set statusline +=%1*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%1*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%1*0x%04B\ %*          "character under cursor

command Paste w | !paste.sh %
command PublicPaste w | !paste.sh -p %

let g:ale_linters = {'python': ['flake8']}
let g:ale_python_auto_pipenv = 1

let $FZF_DEFAULT_COMMAND = 'rg --hidden --no-ignore --glob "!.git/*" -l ""'
let g:notes_directories = ['~/.notes']

nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :TagbarToggle<CR>
