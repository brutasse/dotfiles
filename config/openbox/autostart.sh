# DPI
xrandr --dpi 110

# Keyboard
setxkbmap -model macintosh ch fr
xbindkeys

# SSH agent
eval `ssh-agent`

# GPG agent
eval `gpg-agent --daemon`

eval `gnome-keyring-daemon`

# Volume control
amixer set Master 80% unmute
amixer set Headphone 80% unmute
amixer set Speaker 80% unmute
amixer set PCM 80% unmute

# Blank screen after 5 minutes
xset dpms 300

# Mouse sensiviy
xset m 2/3 4

# MPD
mpd ~/.mpd/mpd.conf &

# wait for the internet connection to work
(sleep 60 && dropboxd) &

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

cd ~
./.bin/post-display

xflux -l 7 &

kupfer --no-splash &
