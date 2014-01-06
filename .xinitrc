xrdb -merge ~/.Xresources

start-pulseaudio-x11
mpd ~/.config/mpd/mpd.conf
nitrogen --restore

xset +fp /usr/share/fonts/local/
xset fp rehash

compton --config .config/compton.conf&

#plank&

#exec i3

sxhkd &
exec bspwm
