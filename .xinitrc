#!/bin/sh
xset -b
xset r rate 300 30
xrdb -load  .Xresources
# use hsetroot to avoid compton background problem
hsetroot -solid '#191919'
# feh --bg-scale "$HOME/wallpaper.jpg"

# X autostart
( # start-pulseaudio-x11 &
sleep 3 &&
stalonetray -i 16 --geometry 1x1-100+0 --grow-gravity W --kludges force_icons_size -bg '#191919' &
keepassx &
clipit &
firejail firefox &
pcmanfm ~/Desktop &
killall volumeicon; volumeicon &
compton &
) &

exec ck-launch-session dbus-launch spectrwm

