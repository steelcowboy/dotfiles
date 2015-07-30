BATPWR=$(acpi -b | grep -o '[0-9]*%')
if [ -z "$BATPWR" ]; then
	true	
else
        echo $BATPWR | dzen2 -fn 'xft:Droid Sans:size=11' -fg '#FFFFFF' -bg \
	'#FF3D00' -x \
	"1270" -y "25" -w "40"  -p 5 -e 'onstart=uncollapse;button1=exit;button3=exit' 

fi

