#!/bin/bash
# region node

fake="virtual-mic"
real=$(hyprctl repl microphone)
post=$(hyprctl repl processor)

# endregion
# region linked

if [[ $1 == linked ]]
then
    if pw-link -io | grep -q $fake
    then
        exit 0
    else
        exit 1
    fi
fi

# endregion
# region unlink

if [[ $1 == unlink ]]
then
    pactl unload-module module-null-sink
    exit 0
fi

# endregion
# region link

if [[ $1 == link ]]
then
    pactl load-module module-null-sink media.class=Audio/Source/Virtual channel_map=mono sink_name=$fake sink_properties=device.description=RPP-Microphone

    pw-link $post:out1 $fake:input_MONO
    pw-link $post:out1 $real:playback_FL -d
    pw-link $post:out2 $real:playback_FR -d

    exit 0
fi

# endregion
