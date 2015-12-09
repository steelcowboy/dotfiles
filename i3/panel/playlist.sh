#! /bin/bash

tod=`cat $HOME/.last_time_state`
. panel_colors_$tod

output=$(playlist.py)
lines=$[$(echo "$output" | wc -l)-1]

if [ -z $output ]; then
	exit 0
else
	echo "$output" | dzen2 -fn 'xft:Droid Sans:size=10' -fg \#$color_sec_fg -bg \#$color_sec_bg -x \
	"85" -y "30" -w "230"  -l \
	$lines -e 'onstart=uncollapse;button1=exit;button3=exit' -p 5 -ta l
fi
