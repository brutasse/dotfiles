# DPI
#set-pointsperpx 2

# Keyboard
#setxkbmap -model dell ch fr
xbindkeys

# WTF bell
xset b off

# GTK
export GTK_THEME=Zukitre
export GTK2_RC_FILES=/usr/share/themes/Zukitre/gtk-2.0/gtkrc

# QT
export QT_STYLE_OVERRIDE="GTK+"
export QT_QPA_PLATFORMTHEME='gtk2'

export MOZ_USE_XINPUT2=1

# GPG agent
eval `gpg-agent --daemon`

# Volume control
amixer set Master 10% unmute
amixer -c 0 set Headphone 50% unmute

# Blank screen after 5 minutes
xset dpms 300

# Mouse sensiviy
xset m 2/3 4

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

pgrep -f emoji-keyboard || emoji-keyboard &

kupfer --no-splash &

xss-lock -- i3lock -e -c 111111 &

(xrandr | grep " connected 2560x1440" && $HOME/.screenlayout/dell-27.sh) || $HOME/.screenlayout/none.sh
