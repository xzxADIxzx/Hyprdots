#!/bin/bash

function mod
{
    if pidof -q hypridle
    then
        ic=""
    else
        ic="s/Inhibit/Catalyze/"
    fi
    if mic linked
    then
        ul=""
    else
        ul="s/Unlink/Link/"
    fi
    sed -e "$ic" -e "$ul" $1
}

killall wofi -s KILL

wofi="$1 --define dmenu-print_line_num=true"
path="$2"

num=$(mod $path-names | $wofi || echo -42)
cmd=$(sed -n "$(($num + 1))p" $path-execs)

hyprctl dispatch exec "$cmd"
