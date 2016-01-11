# Typos
alias vin="vim"
alias bim="vim"
alias got="git"

# Useful
alias webshare='python3 -m http.server'
alias delpyc='find . -iname "*.pyc" -exec rm {} \; ; find . -type d -iname __pycache__ -exec rm -r {} \;'
alias balsamiq="adobe-air ~/.bin/MockupsForDesktop.air"
alias open="xdg-open"
# http://stevelosh.com/projects/t/
alias t='python ~/.bin/t.py --task-dir ~ --list todo.txt --delete-if-empty'
alias check_csrf="grep -r \"CsrfResponseMiddleware\" * >/dev/null&& echo \"Don't use CsrfResponseMiddleware, read django.me/csrf_howto\" || echo \"Good.\""
# https://github.com/defunkt/hub
alias git=hub
alias slf="evince http://www.slf.ch/avalanche/bulletin/fr/gk_c_fr_complete.pdf"
alias mpdupdate="mpc -h brutasse@localhost --wait update"
alias fig="docker-compose"

# Fun
alias suit="svn"  # suit up
alias wtf="which"
alias say="~/.virtualenvs/ikazuchi/bin/ikazuchi speech -a google -s"
alias mkpassword="tr -dc A-Za-z0-9_ < /dev/urandom | head -c 32 | xargs"
alias swisskeyboard="setxkbmap -model macintosh ch fr"
alias fixperms="find . -type f -exec chmod 644 {} \; && find . -type d -exec chmod 755 {} \;"
alias json="python3 -m json.tool"

# Django
alias tests="envdir tests/envdir django-admin.py test"
alias django="envdir envdir django-admin.py"

extrareqs() {
	comm -23 <(pip freeze -l | sort -n) <(cat $1 | sort -n)
}

alias docker-stopped="docker ps -a -q"
alias docker-untagged="docker images -a | grep '^<none>' | tr -s ' ' | cut -d ' ' -f 3"

alias bytes="python -c 'import sys;print(\"\".join(list(map(lambda c: chr(int(c, 16)), sys.argv[1].split()))))'"
