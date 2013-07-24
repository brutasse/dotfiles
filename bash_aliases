# Typos
alias vin="vim"
alias bim="vim"
alias got="git"

# Useful
alias webshare='python -m http.server'
alias delpyc='find . -iname "*.pyc" -exec rm {} \; ; find . -type d -iname __pycache__ -exec rm -r {} \;'
alias balsamiq="adobe-air ~/.bin/MockupsForDesktop.air"
alias open="xdg-open"
# http://stevelosh.com/projects/t/
alias t='python ~/.bin/t.py --task-dir ~ --list todo.txt --delete-if-empty'
alias check_csrf="grep -r \"CsrfResponseMiddleware\" * >/dev/null&& echo \"Don't use CsrfResponseMiddleware, read django.me/csrf_howto\" || echo \"Good.\""
# Tunnel runserver to the real internet
alias revtun='ssh -nNT -R 8000:localhost:8000 bruno.im'
# https://github.com/defunkt/hub
alias git=hub

# Fun
alias suit="svn"  # suit up
alias wtf="which"
alias "bitch,"=sudo  # bitch, /etc/rc.d/nginx reload
alias say="~/.virtualenvs/ikazuchi/bin/ikazuchi speech -a google -s"
alias mkpassword="tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs"
alias swisskeyboard="setxkbmap -model macintosh ch fr"
alias fixperms="find . -type f -exec chmod 644 {} \; && find . -type d -exec chmod 755 {} \;"
alias json="python3 -m json.tool"
