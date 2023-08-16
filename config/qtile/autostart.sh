#! /bin/sh
kanshi &
dropbox &
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
systemctl --user stop  xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk
