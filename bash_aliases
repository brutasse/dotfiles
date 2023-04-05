# Typos
alias vin="vim"
alias bim="vim"
alias got="git"

# Useful
alias webshare='python3 -m http.server'
alias delpyc='find . -iname "*.pyc" -exec rm {} \; ; find . -type d -iname __pycache__ -exec rm -r {} \;'
alias open="xdg-open"
# https://github.com/defunkt/hub
alias git=hub
alias slf="evince http://www.slf.ch/avalanche/bulletin/fr/gk_c_fr_complete.pdf"
alias mpdupdate="mpc -h brutasse@localhost --wait update"
alias fig="docker-compose"
alias diff="diff --color"

alias mkpassword="tr -dc A-Za-z0-9_ < /dev/urandom | head -c 32 | xargs"
alias fixperms="find . -type f -exec chmod 644 {} \; && find . -type d -exec chmod 755 {} \;"
alias json="python3 -m json.tool"

alias docker-stopped="docker ps -a -q"
alias docker-untagged="docker images -a | grep '^<none>' | tr -s ' ' | cut -d ' ' -f 3"
alias docker-cleanup="docker-stopped | xargs docker rm && docker-untagged | xargs docker rmi"
alias apple-keyboard-fix="echo 0 |sudo tee /sys/module/hid_apple/parameters/iso_layout"
alias youtube-audio="youtube-dl -x --audio-format mp3"

alias bytes="python -c 'import sys;print(\"\".join(list(map(lambda c: chr(int(c, 16)), sys.argv[1].split()))))'"
