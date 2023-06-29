#
# ~/.bashrc
#

if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ]; then
	INPUTRC=/etc/inputrc
fi

if [ -f /usr/share/bash_completion ]; then
	. /usr/share/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_completion ]; then
	. ~/.bash_completion
fi

eval "$(register-python-argcomplete pipx)"

# Colors
alias ls='ls --color=auto'
eval `dircolors -b`
export LESS='-R --use-color'
alias ip='ip -color=auto'
alias diff="diff --color"

# Colorized man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Moar history
export HISTSIZE=999999

gray="\001\033[01;90m\002"
blue="\001\033[01;34m\002"
red="\001\033[01;31m\002"
yellow="\001\033[01;33m\002"
cyan="\001\033[00;35m\002"
clr="\001\033[00m\002"

# [dir] $
_BASE_PS1=" $blue[$yellow\W$blue] $yellow$ ${clr}"
PS1="${_BASE_PS1}"


function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer

  if [ "$timer_show" -gt 5 ]; then
    timer_prefix=" $blue[${gray}took $red${timer_show}s$blue]${clr}"
  else
    timer_prefix=""
  fi
  if [ -n "$VIRTUAL_ENV" ]; then
    venv_prefix=" $gray(`basename \"$VIRTUAL_ENV\"`)${clr}"
  else
    venv_prefix=""
  fi
  export PS1="$(gitprompt-rs bash)${timer_prefix}${venv_prefix}${_BASE_PS1}"
}

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi


test -n "$DISPLAY" && export TERM=xterm-kitty

export OOO_FORCE_DESKTOP=gnome
export EDITOR=/usr/bin/vim
export TMPDIR=/tmp
export WORKON_HOME=$HOME/.virtualenvs
export GPG_TTY=$(tty)
source /usr/bin/virtualenvwrapper.sh

export PAGER="less -rF"

has_virtualenv() {
	if [ -e .venv ]; then
		workon `cat .venv` || mkvirtualenv `cat .venv`
	fi
}

has_node_modules() {
	if [ -d node_modules/.bin ]; then
		export _oldpath=$PATH
		export PATH=node_modules/.bin:$PATH
	else
		if [ -n "$_oldpath" ]; then
			export PATH=$_oldpath
			unset _oldpath
		fi
	fi
}

venv_cd() {
	\cd "$@" && has_virtualenv && has_node_modules
}
alias cd="venv_cd"

fix_png() {
	for i in `ls -x *.png`
		do pngcrush -ow $i
	done
}

export GOPATH="/home/brute/.go"
export PATH=~/.local/bin:~/.bin:~/.vim/pack/liquidz/start/vim-iced/bin:~/.go/bin:$PATH
export PYTHONDONTWRITEBYTECODE=1

function pwgrep() {
	gpg --batch -q -d -r bruno@renie.fr $HOME/.pwdb.asc | grep -i $*
}

function pwcat() {
	gpg --batch -q -d -r bruno@renie.fr $HOME/.pwdb.asc
}

function pwedit() {
	[ -z $EDITOR ] && EDITOR=vi
	file=`mktemp /tmp/pwedit.XXXXXX`
	gpg -q -d --batch -r bruno@renie.fr $HOME/.pwdb.asc > $file && \
	$EDITOR $file && \
	gpg -q --batch -a -e -r bruno@renie.fr $file && \
	mv ${file}.asc $(readlink -f $HOME/.pwdb.asc)
	rm -f $file ${file}.asc
}

function aur() {
	cd /var/abs/local
	git clone https://aur.archlinux.org/$1.git
	cd $1
	makepkg
}

function totp() {
	oathtool -b $1 --totp | wl-copy
}

function pwcopy() {
	echo -n `pwgrep $* | awk '{print $nf}'` | xclip -selection clipboard
}

function qrtext() {
	qrencode -o /tmp/qrcode.png $1 && \
	open /tmp/qrcode.png && \
	rm /tmp/qrcode.png
}

alias qrscanner="flatpak run vn.hoabinh.quan.CoBang"

function strftime() {
	echo
	echo "   %a  Weekday as locale’s abbreviated name.                      Wed"
	echo "   %A  Weekday as locale’s full name.                             Wednesday"
	echo "   %d  Day of the month as a zero-padded decimal number.          25"
	echo "   %b  Month as locale’s abbreviated name.                        Dec"
	echo "   %B  Month as locale’s full name.                               December"
	echo "   %m  Month as a zero-padded decimal number.                     12"
	echo "   %y  Year without century as a zero-padded decimal number.      13"
	echo "   %Y  Year with century as a decimal number.                     2014"
	echo "   %H  Hour (24-hour clock) as a zero-padded decimal number.      17"
	echo "   %I  Hour (12-hour clock) as a zero-padded decimal number.      05"
	echo "   %p  Locale’s equivalent of either AM or PM.                    PM"
	echo "   %M  Minute as a zero-padded decimal number.                    15"
	echo "   %S  Second as a zero-padded decimal number.                    30"
	echo "   %f  Microsecond as a decimal number, zero-padded on the left.  000000"
	echo "   %z  UTC offset in the form +HHMM or -HHMM."
	echo "   %Z  Time zone name."
	echo
}

export VIMCLOJURE_SERVER_JAR="$HOME/code/libs/vimclojure/nailgun-server-2.3.6.jar"

# Silence 'Picked up _JAVA_OPTIONS' message on command-line
SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
unset _JAVA_OPTIONS
alias java='java "$_SILENT_JAVA_OPTIONS"'

# WTF ansible
export ANSIBLE_NOCOWS=1


function firewall-my-location() {
	exo compute security-group source add "bruno's locations" "`curl ifconfig.me`/32"
}


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
