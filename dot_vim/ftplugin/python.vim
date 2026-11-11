" black
let g:black_linelength = 79
let g:black_virtualenv = "~/.local/pipx/venvs/black"

let g:ale_linters = {'python': ["ruff"]}
let g:ale_fixers = {'python': ["ruff", "ruff_format"]}

aug MyPythonSetting
  au!
  au VimEnter * setlocal ts=4 sw=4 sts=4 et textwidth=0 smartindent formatoptions=croqj comments=:#\:,:#
aug END
