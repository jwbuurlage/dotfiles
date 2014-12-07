xrdb -merge ~/.Xresources

compton --config .config/compton.conf& --fade-exclude 'name *?= "DOTA"' --shadow-exclude 'name *?= "DOTA"'

gnome-keyring-daemon&

nitrogen --restore

./code/xflux -l 52 -g 5

sxhkd &
exec bspwm -c ~/.config/bspwm/bspwmrc
