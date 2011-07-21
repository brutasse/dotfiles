# DPI
xrandr --dpi 110

# Keyboard
setxkbmap -model macintosh ch fr &
xbindkeys &

# Remote control
irexec &

# SSH agent
eval `ssh-agent` &

eval `gnome-keyring-daemon`

# Volume control
amixer set Master 80% unmute
amixer set Headphone 60% unmute
amixer set PCM 80%
amixer set 'Front Speaker' 80% unmute

# Disable touchpad while typing
syndaemon -t -i 1 -d &

# Blank screen after 5 minutes
xset dpms 300

# Mouse sensiviy
xset m 2/3 4

# MPD
mpd ~/.mpd/mpd.conf &

# Wallpaper
#while true;
#do
#   find $HOME/Photos/wallpapers -type f -name '*.jpg' -o -name '*.png' | shuf -n 1 | xargs feh --bg-scale
#   sleep 15m
#done &

feh --bg-fill ~/Photos/wallpapers/26.jpg &

dropboxd &

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

cd ~/

#stalonetray -t -g 124x48+0-0 --icon-gravity SW --window-layer bottom --sticky &
trayer --edge bottom --align right --transparent true --alpha 255 --widthtype pixel --width 130 &
nm-applet --sm-disable &
conky &

xflux -l 7 &

#skippy &

# Make GTK apps look and behave how they were set up in the gnome config tools
if test -x /usr/libexec/gnome-settings-daemon >/dev/null; then
  /usr/libexec/gnome-settings-daemon &
elif which gnome-settings-daemon >/dev/null 2>&1; then
  gnome-settings-daemon &

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
DESKTOP_ENV=""
if which /usr/lib/openbox/xdg-autostart >/dev/null 2>&1; then
  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
fi
