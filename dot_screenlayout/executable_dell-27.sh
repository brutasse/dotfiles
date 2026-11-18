#!/bin/sh
xrandr \
	--dpi 120 \
	--output `xrandr | grep "connected 2560x1440"| cut -d " " -f1` --auto --pos 0x0 --rotate normal \
	--output eDP-1 --auto --scale-from 1600x900 --pos 2560x540 --rotate normal
set-pointsperpx 1
post-display

	#--output HDMI-2 --off \
	#--output HDMI-1 --off \
	#--output DP-2-1 --auto --pos 0x0 --rotate normal \
	#--output DP-1 --off \
	#--output DP-2 --off \
	#--output DP-2-2 --off \
	#--output DP-2-3 --off \
