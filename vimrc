" vimrc file for Hyunchel Kim <hyunchel.inbox@gmail.com>

" As VIM manual suggest...
source $VIMRUNTIME/defaults.vim

if &t_Co > 2
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" colors
set background=dark
syntax enable
colorscheme seoul256

" the tabs
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on

" misc
set number
set colorcolumn=100
set tags=../tags

" vim-go options
let g:go_template_autocreate = 0

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" quick maps
:ia pdb; import pdb;pdb.set_trace()
:ia #!! #! /usr/bin/env bash

" tab sizes
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
