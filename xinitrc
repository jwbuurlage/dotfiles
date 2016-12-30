source ~/.profile

# merge terminal colors and xft settings
xrdb -merge ~/.Xresources

# start mpd
mpd ~/.config/mpd/mpd.conf

# start pulse
start-pulseaudio-x11

# extra fonts
# xset +fp /usr/share/fonts/local/
# xset fp rehash

# mouse acceleration
xset m 0

# normal cursor
xsetroot -cursor_name -left_ptr
xsetroot -solid '#111111'

# try to mount ext hd
#udisks --mount /dev/disk/by-uuid/84E683F2E683E332&
pmount /dev/disk/by-uuid/84E683F2E683E332

# screensaver + energy saving
xset -dpms
xset s off

xflux -l 52 -g 5
#transmission-daemon
compton --config .config/compton.conf&

# start notification daemon
twmnd&

# window manager + hotkey daemon
sxhkd &
exec bspwm
