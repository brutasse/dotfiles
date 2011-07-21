#!/bin/sh
source /etc/X11/xinit/xinitrc.d/30-dbus
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
exec dbus-launch ck-launch-session ssh-agent openbox-session
