# DPI
set-pointsperpx 2

# Keyboard
setxkbmap -model dell ch fr
xbindkeys

# GTK
export GTK_THEME=Zukitre
export GTK2_RC_FILES=/usr/share/themes/Zukitre/gtk-2.0/gtkrc

# QT
export QT_STYLE_OVERRIDE="GTK+"

# GPG agent
eval `gpg-agent --daemon`

# Volume control
amixer set Master 10% unmute

# Blank screen after 5 minutes
xset dpms 300

# Mouse sensiviy
xset m 2/3 4

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

cd ~
./.bin/post-display

kupfer --no-splash &

xss-lock -- i3lock -e -c 111111 &
