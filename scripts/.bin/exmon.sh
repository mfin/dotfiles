if xrandr -q | grep "DP2 connected" > /dev/null ; then
    xrandr --output DP2 --auto --right-of eDP1
    bspc monitor DP2 -d 6 7
    echo "VGA connected"
fi