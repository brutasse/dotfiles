set nocompatible        	" prevents from original vi's bugs & limitations
set ls=2                	" always show status line
set tw=78               	" text width
set autoindent
set smartindent
set scrolloff=3         	" keep 3 lines when scrolling
set mouse=v             	" allow copy/paste under X
set showmatch           	" verify brace/parenthesis/bracket
set visualbell t_vb=    	" disable horrible beep when a cmd doesn' work
set ruler               	" display cursor position
set showcmd             	" display incomplete commands
set hlsearch            	" highlight search
set incsearch           	" incremental search
set ignorecase          	" ignore case when searching
set smartcase           	" ignore case unless uppercase is used
set nobackup            	" no backup file
set directory=~/.vim/swap,~/tmp " no spread swap files
set formatprg=par\ -w78q        " 'gqip' to format a §
set autoread			" auto-read files changed outside of vim

let base16colorspace=256        " custom
colorscheme fruity256  		" color
syntax on			" scheme

let mapleader=","		" leader key
let localleader="\\"		" local leader
nmap <silent><leader>l :set list!<CR>
set listchars=tab:➜\ ,eol:¬	" list
let g:rainbow_active = 1	" rainbow parentheses
let g:rainbow_conf = {'ctermfgs': ['blue', 'yellow', 'cyan', 'brown', 'magenta']}
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:astro_typescript = 'enable'

ab bl <Esc>bi{% block <Esc>ea %}{% endblock %}<Esc>h%i

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'terraform': ['terraform'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '🛑'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

if has("autocmd")
	filetype plugin indent on

	" restore cursor position
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

	augroup ftdetect
		au BufRead,BufNewFile Jenkinsfile set filetype=groovy
		au BufRead,BufNewFile *.html set filetype=htmldjango
		au BufRead,BufNewFile *.sls set filetype=yaml
		au BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
		au FileType javascript,astro setlocal ts=2 sw=2 sts=2 et textwidth=0 smartindent
		au FileType groovy,html,xhtml,css,scss,xml,xsl,htmldjango setlocal et sw=4 ts=4 sts=4 textwidth=0
		au FileType helpfile,text setlocal nonumber
		au FileType yaml setlocal sw=2 ts=2 sts=2
		au FileType groovy setlocal sw=2 ts=2 sts=2
		au FileType text,rst,tex setlocal textwidth=78
		au FileType rst setlocal sw=4 ts=4 sts=4 spell
		au FileType markdown,rst,text,gitcommit setlocal spell
		au FileType javascript,htmldjango au BufWritePre <buffer> :%s/\s\+$//e
	augroup END
endif
