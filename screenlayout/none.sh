#!/usr/bin/env sh
xrandr \
	--output eDP1 --mode 3200x1800 --pos 0x0 --rotate normal \
	--output DP1 --off \
	--output DP2 --off \
	--output VIRTUAL1 --off \
	--output HDMI1 --off \
	--output HDMI2 --off
set-pointsperpx 2
post-display
