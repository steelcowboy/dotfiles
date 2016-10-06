#! /bin/zsh

if [ $(pgrep -cx panel) -gt 1 ] ; then
	killall panel
fi

last_state="/home/steelcowboy/.last_time_state"
hour_of_day=`date +%H`

if [[ "$hour_of_day" -lt 6 || "$hour_of_day" -ge 20 ]]; then
	time_of_day="night"
elif [[ "$hour_of_day" -lt 12 && "$hour_of_day" -ge 6 ]]; then
	time_of_day="morning"
elif [[ "$hour_of_day" -lt 18 && "$hour_of_day" -ge 12 ]]; then
	time_of_day="afternoon"
elif [[ "$hour_of_day" -lt 20 && "$hour_of_day" -ge 18 ]]; then
	time_of_day="evening" 
fi

echo $time_of_day > $last_state
wallpaper="/home/steelcowboy/Pictures/wallpapers/$time_of_day.jpg"

feh --bg-scale $wallpaper
xrdb -merge <(cat ~/.Xresources ~/.config/rofi/colorschemes/rofi_$time_of_day.xr)
panel $time_of_day >&/dev/null &

