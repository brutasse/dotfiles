# DPI
xrandr --dpi 240
gsettings set org.gnome.desktop.interface scaling-factor 2

# Keyboard
setxkbmap -model dell ch fr
xbindkeys

# GTK
export GTK_THEME=Zukitwo
export GTK2_RC_FILES=/usr/share/themes/Zukitwo/gtk-2.0/gtkrc

# GPG agent
eval `gpg-agent --daemon`

#eval `gnome-keyring-daemon`

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
