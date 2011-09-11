# Typos
alias vin="vim"
alias bim="vim"
alias got="git"

# Useful
alias grep="ack"
alias webshare='python -m http.server'
alias delpyc='find . -iname "*.pyc" -exec rm {} \;'
alias balsamiq="adobe-air ~/.bin/MockupsForDesktop.air"
alias open="xdg-open"
# http://stevelosh.com/projects/t/
alias t='python ~/.bin/t.py --task-dir ~ --list todo.txt --delete-if-empty'
alias check_csrf="grep -r \"CsrfResponseMiddleware\" * >/dev/null&& echo \"Don't use CsrfResponseMiddleware, read django.me/csrf_howto\" || echo \"Good.\""
# Tunnel runserver to the real internet
alias revtun='ssh -nNT -R 8000:localhost:8000 bruno.im'

# Fun
alias suit="svn"  # suit up
alias wtf="which"
alias "bitch,"=sudo  # bitch, /etc/rc.d/nginx reload
