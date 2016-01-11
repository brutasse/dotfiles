#!/usr/bin/env sh
xrandr \
	--output eDP1 --mode 1600x900 --pos 2560x540 --rotate normal \
	--output DP1 --mode 2560x1440 --pos 0x0 --rotate normal \
	--output DP2 --off \
	--output VIRTUAL1 --off \
	--output HDMI1 --off \
	--output HDMI2 --off
set-pointsperpx 1
post-display
