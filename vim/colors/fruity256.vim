set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "fruity256"

hi Normal cterm=standout ctermfg=7
hi NonText cterm=bold ctermfg=59
hi SpecialKey cterm=bold ctermfg=59
" cursor does not work
hi Cursor cterm=standout ctermfg=0
hi lCursor cterm=standout ctermfg=235

hi Search cterm=standout ctermfg=124
hi IncSearch cterm=standout ctermfg=124

hi Todo cterm=NONE ctermfg=88 ctermbg=196
hi Title cterm=NONE ctermfg=7
hi Special cterm=NONE ctermfg=208

hi String cterm=NONE ctermfg=32
hi Constant cterm=bold ctermfg=32
hi Number cterm=bold ctermfg=38
hi Statement cterm=NONE ctermfg=202
hi Function cterm=NONE ctermfg=199
hi PreProc cterm=NONE ctermfg=196
hi Comment cterm=italic ctermfg=34
hi Type cterm=NONE ctermfg=181
"hi Type cterm=NONE ctermfg=186
hi Error cterm=NONE ctermfg=7
hi Identifier cterm=NONE ctermfg=199
hi Label cterm=NONE ctermfg=199

" python.vim
hi pythonCoding cterm=NONE ctermfg=199
hi pythonRun cterm=NONE ctermfg=199
hi pythonBuiltinObj cterm=NONE ctermfg=37
hi pythonBuiltinFunc cterm=NONE ctermfg=37
hi pythonException cterm=NONE ctermfg=196
hi pythonExClass cterm=NONE ctermfg=58
hi pythonFunction cterm=NONE ctermfg=198
hi pythonClass cterm=NONE ctermfg=196

" Django
hi djangoArgument cterm=NONE ctermfg=32
hi djangoStatement cterm=NONE ctermfg=202
hi djangoFilter cterm=NONE ctermfg=205
hi djangoTagBlock cterm=NONE ctermfg=196
hi djangoVarBlock cterm=NONE ctermfg=200

" html
hi htmlTag cterm=NONE ctermfg=38
hi htmlEndTag cterm=NONE ctermfg=38
hi htmlSpecialTagName cterm=NONE ctermfg=44
hi htmlTagName cterm=NONE ctermfg=42
hi htmlTagN cterm=NONE ctermfg=42
hi htmlEvent cterm=NONE ctermfg=7

" VimChant
hi SpellBad cterm=underline ctermfg=180 ctermbg=0
