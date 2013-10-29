set nocompatible	" Vi Improved mode
filetype off


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

set shiftwidth=4
set shiftround
set expandtab
set autoindent
set softtabstop=4
set backspace=2		" more powerful backspacing
set ruler

let mapleader = "ö"

syntax on
filetype plugin indent on

autocmd BufRead,BufNewFile *.qbs setfiletype qml

" Function to remove trailing whitespaces
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction

" Automatically remove trailing whitespace from certain filetypes
autocmd BufWritePre *.{cpp,hpp,c,h} :call StripTrailingWhitespace()

" Map trailing whitespace removal
nnoremap <Leader>s :call StripTrailingWhitespace()<CR>

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle - plugin package manager
Bundle 'gmarik/vundle'

"""""""""""
" PLUGINS "
"""""""""""

" Fugitive - Git support
Bundle 'tpope/vim-fugitive'

" Vim Dispatch - asynchronous compile/make/test
Bundle 'tpope/vim-dispatch.git'

" Helper functions and commands for programming in VIM
Bundle 'L9'

" Sparkup - Write html expressions fast
Bundle 'rstacruz/sparkup'

" Configurable completions
Bundle 'ervandew/supertab'

" UltiSnips - Snippet expander
Bundle 'UltiSnips'

" LustyJuggler - Fast open file changing with <Leader>lj
Bundle 'LustyJuggler'

" FuzzyFinder - Fuzzy pattern file/tag/everything finder
Bundle 'FuzzyFinder'
nnoremap <Leader>ff :FufFile**/<CR>

" Vertigo - Better vertical movement
Bundle 'prendradjaja/vim-vertigo'

" Editorconfig - Way to configure simple styles accross different editors
Bundle 'editorconfig/editorconfig-vim'

" Command
Bundle 'git://git.wincent.com/command-t.git'

" Alternate file opener
Bundle 'a.vim'

""""""""""""""""""""""""""""""""
" Programming language support "
""""""""""""""""""""""""""""""""
" QML Syntax highlighting
Bundle 'peterhoeg/vim-qml'

" Javascript indentation and syntax and few other misc features
Bundle 'pangloss/vim-javascript'

" CoffeeScript support to vim. Covers syntax, indenting, compiling and more
Bundle 'kchmck/vim-coffee-script'

" Navigation and syntax highlight etc. in Ruby on Rails projects
Bundle 'tpope/vim-rails.git'

" Jade template engine syntax highlighting and indent
Bundle 'digitaltoad/vim-jade'

" clang_complete - autocompletion using libclang for C-like languages
Bundle 'Rip-Rip/clang_complete'


set hidden
