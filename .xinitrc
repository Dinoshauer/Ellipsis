#!/bin/bash

IN="eDP1"
EXT="HDMI1"

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $IN --auto --output $EXT --off
else
    xrandr --output $IN --auto --primary --output $EXT --auto --right-of $IN
fi


setxkbmap dk &
xsetroot -cursor_name left_ptr &
feh --bg-scale `ls /home/k/git/ellipsis/wallpapers/*.jpg | sort -R | tail -n 1` &
sxhkd -f 100 -c /home/k/.config/sxhkd/sxhkdrc &
compton --config /home/k/.config/compton/compton.conf &

exec bspwm
