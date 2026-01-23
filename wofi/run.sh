#!/bin/bash

function mod
{
    if pidof -q hypridle
    then
        cat $1
    else
        sed -e "s/Inhibit/Catalyze/" $1
    fi
}

killall wofi -s KILL

wofi="$1 --define dmenu-print_line_num=true"
path="$2"

num=$(mod $path-names | $wofi || echo -1)
cmd=$(sed -n "$(($num + 1))p" $path-execs)

hyprctl dispatch exec "$cmd"
