" Vim color file
" Maintainer:	Min Ma <mamin506@gmail.com>
" Last Change:	$Date: 2015/05/30 07:23:14 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

highlight clear
if exists("syntax_on")
  syntax reset
endif

"load the base colorscheme
runtime colors/desert.vim

"Override the name of the base colorscheme
let g:colors_name = "my_desert"

"Clear the colors for any items that you don't like
highlight clear Folded

"Set up your new & improved colors
hi Folded	ctermfg=Brown ctermbg=NONE
