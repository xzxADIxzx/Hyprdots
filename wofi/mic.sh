#!/bin/bash
# region constants

real="alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo"
fake="virtual-mic"
post="REAPER"

# endregion
# region linked

if echo $1 | grep -q "linked"
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

if echo $1 | grep -q "unlink"
then
    pactl unload-module module-null-sink
    exit 0
fi

# endregion
# region link

if echo $1 | grep -q "link"
then
    pactl load-module module-null-sink media.class=Audio/Source/Virtual channel_map=mono sink_name=$fake sink_properties=device.description=RPP-Microphone

    pw-link $post:out1 $fake:input_MONO
    pw-link $post:out1 $real:playback_FL -d
    pw-link $post:out2 $real:playback_FR -d

    exit 0
fi

# endregion
