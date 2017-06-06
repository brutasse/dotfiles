"
" ~/.vimrc - brutasse
"

set nocompatible  	" prevents from original vi's bugs & limitations
set ls=2          	" allways show status line
set tw=78		" textwidth : 78 chars

set autoindent		" auto indentation
set smartindent     	" smart indent
set scrolloff=3     	" keep 3 lines when scrolling

set mouse=v		" allow copy/paste under X

set showmatch 		" verify brace/parenthes/bracket

set visualbell t_vb= " disable horrible beep when a command doesn't work

set ruler 	    " display the curent cursor position
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch	    " search letter by letter
set ignorecase      " ignore case when searching
set smartcase       " ignore case unless you type uppercase
"set noignorecase   " don't ignore case

set nobackup        " do not keep a backup file
"set number          " show line numbers
"set virtualedit=all " allow to put the cursor everywhere

"set list	" show tab whith -
"set listchars=tab:>-,trail:-
set pastetoggle=<F12>
set directory=~/.vim/swap,~/tmp

set formatprg=par\ -w78q

set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme fruity256
"colorscheme base16-default

execute pathogen#infect()

filetype off
call pathogen#runtime_append_all_bundles()
syntax on           " syntax highlighing

if has("autocmd")
	set nocp
	filetype plugin indent on		" enable file type detection
	"let g:pydiction_location = '/usr/share/pydiction/complete-dict'


	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	
	" numbers of spaces to (auto)indent  | 8 for C
	" numbers of spaces of tab character | 4 for C++
	autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab 
	autocmd FileType c setlocal ts=4 sw=4 sts=4 et smartindent
	autocmd FileType python setlocal ts=4 sw=4 sts=4 et textwidth=0 smartindent formatoptions=croqj comments=:#\:,:#
	"autocmd FileType python setlocal ts=4 sw=4 sts=4 et textwidth=0 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

	autocmd FileType javascript setlocal ts=4 sw=4 sts=4 et textwidth=0 smartindent

	" Autocomplete
	"autocmd FileType java setlocal omnifunc=javacomplete#Complete
	"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	"autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
	"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

	" for both CSS and HTML, use genuine tab characters for indentation,
	" to make files a few bytes smaller:
	autocmd FileType html,xhtml,css,scss,xml,xsl,htmldjango setlocal et sw=4 ts=4 sts=4 textwidth=0
	" Actually, no
	"autocmd FileType html,xhtml,css,xml,xsl,htmldjango setlocal expandtab sw=2 ts=2 sts=2 textwidth=0

	au FileType helpfile setlocal nonumber  " no line numbers when viewing help
	au BufRead,BufNewFile *.html set filetype=htmldjango " Who does HTML anyway
	au BufRead,BufNewFile *.sls set filetype=yaml
	au FileType yaml setlocal sw=2 ts=2 sts=2

	au FileType text setlocal nonumber   " no line numbers when viewing text
	au FileType text,rst,tex setlocal textwidth=78 
	au FileType rst setlocal sw=4 ts=4 sts=4
	au FileType javascript,python,htmldjango,clojure au BufWritePre <buffer> :%s/\s\+$//e
endif " has("audocmd")

" Keyboard mappings
" ctr+T : newtab, ctr+a/z lefttab & righttab
map <C-t> <Esc>:tabnew<CR> 
map <F5> <Esc>:tabprevious<CR>
map <F6> <Esc>:tabnext<CR>
map <F7> <Esc>:setlocal spell spelllang=en_gb<CR>
map <F8> <Esc>:setlocal nospell<CR>

let mapleader=","
let localleader="\\"
nmap <silent><leader>l :set list!<CR>
set listchars=tab:➜\ ,eol:¬

" taglist plugin
"map <F8> :TlistToggle<CR>

" Autocomplete
iab #i #include
iab #d #define
iab #s #!/bin/sh
iab #r #!/usr/bin/ruby
iab #y #!/usr/bin/env python
iab #l #!/usr/bin/perl
ab bl <Esc>bi{% block <Esc>ea %}{% endblock %}<Esc>h%i

" markdown.vim
let g:vim_markdown_folding_disabled=1

" javascript.vim
let javascript_enable_domhtmlcss=1
let b:javascript_fold=0

" vim-python-combined
let python_highlight_all=1
let python_highlight_exceptions=0

" VimClojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
let vimclojure#SplitPos = "bottom"

inoremap # X<BS>#
