#!/bin/bash
# region logs

function region
{
    [[ -z $quiet ]] && echo -e "\e[1;32m => $1 \e[0;39m"
}

function common
{
    [[ -z $quiet ]] && echo -e "\e[1;34m << $1 \e[0;39m"
}

function faulty
{
    [[ -z $quiet ]] && echo -e "\e[1;31m !! $1 \e[0;39m"
}

# endregion
# region help

if [[ $1 == *h* || $# == 0 ]]
then
    echo "Feeds the fuzzy finder"
    echo ""
    echo "Usage: search <operations> [file]"
    echo "Operations:"
    echo "    -h display this text"
    echo "    -f feed the file"
    echo "    -c feed the clipboard"
    exit 0
fi

# endregion
# region feed

blue=$(hyprctl repl blue)
pink=$(hyprctl repl pink)
dark=$(hyprctl repl dark)
pale="#E2E2E2"

export FZF_DEFAULT_OPTS=\
"
    --style=minimal
    --layout=reverse
    --height=5
    --ellipsis=···

    --prompt=' > '
    --pointer='  '
    --ghost=Search
    --info=hidden

    --highlight-line
    --color='prompt:$blue,bg+:$pink,fg+:$dark,hl+:$dark,fg:$pale,hl:$pale'

    --ignore-case
    --tiebreak=length

    --accept-nth=1
    --with-nth=2
"

# endregion
# region file

if [[ $1 == *f* ]]
then
    region "Feeding the file..."

    if [[ -z $2 || ! -e $2-names || ! -e $2-execs ]]
    then
        faulty "No file was found"
        exit 1
    fi

    if [[ ! -e /tmp/inhibit ]]
    then
        ic=""
    else
        ic="s/Inhibit/Catalyze/"
    fi

    if com linked
    then
        ul=""
    else
        ul="s/Unlink/Link/"
    fi

    line=$(sed -e "$ic" -e "$ul" $2-names | nl -s @ | fzf --delimiter=@)

    if [[ -z $line ]]
    then
        common "No line was selected"
        exit 0
    fi

    hyprctl dispatch "hl.dsp.exec_raw([[ $(sed -n "${line}p" $2-execs) ]])" &> /dev/null
fi

# endregion
# region clipboard

if [[ $1 == *c* ]]
then
    region "Feeding the clipboard..."

    line=$(cliphist list | fzf --delimiter=$'\t')

    if [[ -z $line ]]
    then
        common "No line was selected"
        exit 0
    fi

    cliphist decode $line | wl-copy &> /dev/null
fi

# endregion
