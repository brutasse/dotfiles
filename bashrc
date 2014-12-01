#
# ~/.bashrc
#

if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ]; then
	INPUTRC=/etc/inputrc
fi

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_completion ]; then
	. ~/.bash_completion
fi

# Colorized ls
alias ls='ls --color=auto'
eval `dircolors -b`

# Keep the color in less
alias less='less -R'

# Colorized man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# [user] [dir] $
PS1=' \[\033[01;34m\][\[\033[01;33m\]\W\[\033[01;34m\]] \[\033[00;35m\]$(vcprompt)\[\033[01;33m\]$\[\033[00m\] '

test -n "$DISPLAY" && export TERM=xterm-color
export TERM=rxvt-unicode

export OOO_FORCE_DESKTOP=gnome
export EDITOR=/usr/bin/vim
export TMPDIR=/tmp
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export TEXINPUTS=".:~/Boulot/cv/sources/:"
export PAGER=~/code/libs/mysqlpager/mypager.pl

has_virtualenv() {
	if [ -e .venv ]; then
		workon `cat .venv`
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

export PATH=$PATH:~/.bin
export PATH=$PATH:/home/brute/code/libs/sandbox/gpyretest/bin
export PATH=~/.local/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib
export PYTHONSTARTUP=~/.pythonrc
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
	mv ${file}.asc $HOME/.pwdb.asc
	rm -f $file ${file}.asc
}

function pwcopy() {
	echo -n `pwgrep $* | awk '{print $nf}'` | xclip -selection clipboard
}

function fuck() {
	echo
	echo " (╯°□°）╯︵$(echo $2|flip &2>/dev/null)"
	echo
}

function pypi() {
	open https://pypi.python.org/pypi/$*
}

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
