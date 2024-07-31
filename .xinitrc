xset r rate 170 37
#xrandr -s 1920x1080
#xrandr --dpi 96
xwallpaper --zoom $HOME/Pictures/wallhaven-5gorx9.jpg

dunst &
dwmblocks &

while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
