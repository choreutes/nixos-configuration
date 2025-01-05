" init.vim - Neovim configuration file
"
" Maintainer:
" Tobias Schmalz
" (tobias.schmalz@choreutes.de)

" General settings {{{
" ----------------
set nocompatible

set modelines=8
" }}}

"Plugin Settings {{{
"-------
filetype indent on
filetype plugin on

let maplocalleader=","

" Airline settings {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'
" }}}

" Vimtex settings {{{
" ---------------
let g:tex_flavour = 'latex'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
			\ 'backend':'nvim',
			\ 'continuous':0
			\ }

let g:vimtex_indent_on_ampersands = 0
" }}}

" }}}

" User Interface {{{
" --------------
set number

set wrap
set linebreak

set scrolloff=3

set wildmenu
set wildignore=*.o,*~

set list
set listchars=tab:»\ ,trail:·

" Maybe set this on a per-filetype basis?
" set colorcolumn=80,120

set splitright
set splitbelow

set visualbell
set belloff=cursor,error,esc
" }}}

" Searching {{{
" ---------
set hlsearch

set ignorecase
set smartcase
" }}}

" Colours and fonts {{{
" -----------------
syntax enable

" Nicer background colour for colourscheme breezy
set background=dark
set termguicolors

hi Normal guibg=NONE ctermbg=NONE

colorscheme PaperColor

hi Normal guibg=NONE ctermbg=NONE
" }}}

" Tabs & Indenting {{{
" ----------------
set tabstop=4
set shiftwidth=4
set noexpandtab

set breakindent
" }}}

" Folding {{{
" -------
set foldenable
set foldmethod=syntax
set foldlevelstart=0
set foldcolumn=3
nnoremap <space> za
" }}}

" Key Mappings {{{
" ------------
noremap j gj
noremap k gk
noremap ^ g^
noremap $ g$

nnoremap Q <nop>
" }}}

" File Handling {{{
" -------------
set encoding=utf-8
set fileencoding=utf-8
" }}}

" Filetype specific settings {{{
" --------------------------
augroup python_settings
	" Delete all autocommands from this group
	autocmd!

	autocmd FileType python set softtabstop=4 shiftwidth=4 expandtab
augroup END
" }}}


" vim:foldmethod=marker:foldmarker={{{,}}}
