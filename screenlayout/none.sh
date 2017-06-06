#!/usr/bin/env sh
xrandr \
	--dpi 240 \
	--output eDP-1 --auto --pos 0x0 --rotate normal \
	--output DP-1 --off \
	--output DP-2 --off \
	--output HDMI-1 --off \
	--output HDMI-2 --off
set-pointsperpx 2
post-display
