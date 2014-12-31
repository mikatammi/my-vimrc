source ~/.vimrc_myvimrcpath

let mapleader = "ö"

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Include Bundle configuration file
execute 'source ' . g:myvimrcpath . '/bundles'

call neobundle#end()

" Required:
filetype plugin indent on
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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
autocmd BufWritePre *.{cpp,hpp,c,h,cc,hh,tex,bib,qbs,qml,sh} :call StripTrailingWhitespace()

" Map trailing whitespace removal
nnoremap <Leader>s :call StripTrailingWhitespace()<CR>

" Hide files instead of closing them
set hidden

" Show line numbers
set number

" Error column background as black
hi SignColumn ctermbg=232

" Include project configs
execute 'source ' . g:myvimrcpath . '/projects'
