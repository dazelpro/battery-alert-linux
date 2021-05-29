#!/usr/bin/env bash
while true
do
    export DISPLAY=:0.0

    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    if on_ac_power; then
        if [ $battery_percent -ge 98 ]; then
            notify-send "Battery Full" "Level: ${battery_percent}%"
            paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        fi
    else 
        if [ $battery_percent -le 25 ]; then
            notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_percent}%"
            paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        fi
    fi
    
    sleep 10 # (10 second)
done
