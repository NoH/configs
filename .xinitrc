setxkbmap se
xrandr --output DVI-0 --auto --right-of DVI-1
xrandr --output DVI-1 --auto --left-of DVI-0
xcompmgr &
exec xmonad
(sleep 2 && sh ~/.fehbg)
