" ------------------------------------------------------------------------------
" Author: Minm
" Modify Date:	2013  Nov 20
"               2014  Mar 24
"
" ------------------------------------------------------------------------------

" General Setting ---------------------------- {{{
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" keep 50 lines of command line history
set history=50

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" In an xterm the mouse should work quite well, thus enable it.
" set mouse=a

" Fold method is marker
" set foldmethod=marker

" Always show current position
set ruler		" show the cursor position all the time

" Show command in status line
set showcmd		" display incomplete commands

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Makes search act like search in modern browers
set incsearch		" do incremental searching

" Show the line number
set nu

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb =
set tm=500

" set color scheme
colorscheme my_desert
set background=dark

" Turn backup off
"set nobackup

" add the corrent directory
set path+=

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set nobackup		" do not keep a backup file
endif

" Set leader
let mapleader = "-"

" Vundle
if !(has("win32") || has("win16"))
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " Let Vundle manage itself
  Plugin 'gmarik/Vundle.vim'

  " Plugins
  Plugin 'bling/vim-airline'

  call vundle#end()
endif

" }}}

" Status Line ------------------------------- {{{

" }}}

" Editing mappings -------------------------- {{{
" Don't use Ex mode, use Q for formatting
map Q gq

" Fold and unfold
nnoremap <space> za

" Word to uppercase
inoremap <c-u> <Esc>viwUi
nnoremap <c-u> viwU

" Edite .vimrc file
nnoremap <leader>ev :vs $MYVIMRC<cr>

" Source .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" goto the middle of current line
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>

" insert data and time in format:  2015/05/30 07:23/12
nnoremap <F5> "=strftime("%Y/%m/%d %T")<CR>P
inoremap <F5> <C-R>=strftime("%Y/%m/%d %T")<CR>

" }}}

" Auto command ------------------------------- {{{
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

  " Vimscript file settings -------------------- {{{
  augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
  augroup END
  " }}}

else
    set autoindent		" always set autoindenting on

endif " has("autocmd")
" }}}

" Functions declare ------------------------- {{{

function! Template_module(lang)
    if a:lang ==? "vhdl"
        let l:content=""
        let l:content=ll:content . "library IEEE;\n"
        let l:content=l:content . "use IEEE.STD_LOGIC_1164.all;\n"
        let l:content=l:content . "use IEEE.NUMERIC_STD.all;\n\n"
        let l:content=l:content . "entity ett_name is\n\tgeneric (\n);\n\tport (\n);\nend entity ett_name;\n\n"
        let l:content=l:content . "architecture att_name is\n\nbegin\n\nend architecture att_name;\n"
    else
        let l:content=""
        let l:content=l:content . "`timescale 1ns/1ps\n\n"
        let l:content=l:content . "module  (\n);\n"
        let l:content=l:content . "//------------------------Parameter----------------------\n\n"
        let l:content=l:content . "//------------------------Local signal-------------------\n\n"
        let l:content=l:content . "//------------------------Instantiation------------------\n\n"
        let l:content=l:content . "//------------------------Body---------------------------\n\n"
        let l:content=l:content . "endmodule\n"
    endif
    call setreg('z',l:content)
    normal "zP
endfunction

command Templatevhdl :call Template_module("vhdl")

" }}}

" Plugin setting ------------------------------- {{{
" Setting Tlist 
    " do not auto open tlist window
    let Tlist_Auto_Open = 0

    " auto update tlist window
    let Tlist_Auto_Update = 1

    " close tlist window when it is the only window
    let Tlist_Exit_OnlyWindow = 1

" airline setting
  "Appear status line all the time
  set laststatus=2
    

" }}}

" MISC ----------------------------------------- {{{
" iabbrs
  iabbr #c     ########################################

" }}}

" Auto complete pairs
let s:EnableAutoPair=1
let s:PAIRS='()[]{}'

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if s:EnableAutoPair==1
    " do key map
    for i in range(strlen(s:PAIRS))
        exe "inoremap " . s:PAIRS[i] . " <C-R>=AutoPair('" . s:PAIRS[i] . "')<CR>"
    endfor
endif

function! AutoPair(p)
    let i=stridx(s:PAIRS,a:p)
    if i==-1
        return a:p
    elseif i%2==0
        return a:p . s:PAIRS[i+1] . "\<LEFT>"
    elseif getline('.')[col('.')-1]==a:p
        return "\<RIGHT>"
    else
        return a:p
    endif
endfunction

