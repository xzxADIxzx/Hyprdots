-- region colors

blue = "#55A5F5"
pink = "#BF90FB"
dark = "#18182E"
dawn = "#FACFDA"

-- endregion
-- region values

root = "~/repos/Hyprdots"
monitor = "external" -- whether the monitor is external (desktop) or internal (laptop)
microphone = "micro" -- path to the pipewire node of the microphone
processor = "REAPER" -- path to the pipewire node of the processor

-- endregion
-- region tools

local menu =
[[
    pkill -f "^kitty --class menu-$type" && exit 0
    pkill -f "^kitty --class menu"
    kitty --class menu-$type --config ]] .. root .. [[/kitty/kitty.conf --config ]] .. root .. [[/kitty/search.conf env quiet=1 search
]]

menu_apps = hl.dsp.exec_raw([[ type="apps" ; ]] .. menu:sub(1, -2) .. [[ -f ]] .. root .. [[/kitty/app ]])
menu_acts = hl.dsp.exec_raw([[ type="acts" ; ]] .. menu:sub(1, -2) .. [[ -f ]] .. root .. [[/kitty/act ]])
menu_hist = hl.dsp.exec_raw([[ type="hist" ; ]] .. menu:sub(1, -2) .. [[ -c ]])

term = hl.dsp.exec_raw([[ kitty ]])
pick = hl.dsp.exec_raw([[ hyprpicker -qraf hex ]])
lock = hl.dsp.exec_raw([[ loginctl lock-session ]])

format_date = [[ date +"%A, the %-dxx of %B" | sed "s/11xx/11th/; s/12xx/12th/; s/13xx/13th/; s/1xx/1st/; s/2xx/2nd/; s/3xx/3rd/; s/xx/th/" ]]
format_time = [[ date +"%H:%M" ]]
format_both = [[ date +"%Y-%m-%d %H:%M:%S" ]]

notify_date = hl.dsp.exec_raw([[ hyprctl notify -1 4242 "]] .. blue .. [[" $( ]] .. format_date .. [[ ) ]])
notify_time = hl.dsp.exec_raw([[ hyprctl notify -1 4242 "]] .. blue .. [[" $( ]] .. format_time .. [[ ) ]])
notify_both = hl.dsp.exec_raw([[ hyprctl notify -1 4242 "]] .. blue .. [[" $( ]] .. format_both .. [[ ) ]])

local screenshot =
[[
    hyprpicker -qrz &
    sleep .1
    hpid=$!
    rect=$(slurp -dF "Comic Sans MS" -b "#18182E52" -c "#BF90FB80")
    sleep .2
    grim -g "$rect"
]]

screenshot_copy = hl.dsp.exec_raw(screenshot:sub(1, -2) .. [[ - | wl-copy ; kill $hpid ]])
screenshot_save = hl.dsp.exec_raw(screenshot:sub(1, -2) .. [[ "screenshots/Screenshot of $( ]] .. format_both .. [[ ).png" ; kill $hpid ]])

local brightness =
{
    external =
    {
        inc = "ddcutil setvcp 10 + 5 --bus 2 --skip-ddc-checks --noverify",
        dec = "ddcutil setvcp 10 - 5 --bus 2 --skip-ddc-checks --noverify",
        off = "ddcutil setvcp 10   5 --bus 2 --skip-ddc-checks --noverify",
        res = "ddcutil setvcp 10 100 --bus 2 --skip-ddc-checks --noverify",
    },
    internal =
    {
        inc = "brightnessctl set 5%+",
        dec = "brightnessctl set 5%-",
        off = "brightnessctl -s set 5%",
        res = "brightnessctl -r",
    },
}

brightness_inc = hl.dsp.exec_raw(brightness[monitor].inc)
brightness_dec = hl.dsp.exec_raw(brightness[monitor].dec)
brightness_off = hl.dsp.exec_raw(brightness[monitor].off)
brightness_res = hl.dsp.exec_raw(brightness[monitor].res)

volume_inc = hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ --limit 1")
volume_dec = hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%- --limit 1")
volume_tgl = hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")

-- endregion
-- region configs

hyprpaper =
[[
    echo "splash = false" &> /tmp/hyprpaper
    hyprpaper -c /tmp/hyprpaper &

    until hyprctl hyprpaper wallpaper ", ]] .. root .. [[/backgrounds/cats-sitting.png"
    do
        sleep .1
    done
]]
hypridle = [[ hypridle ]]

-- endregion
