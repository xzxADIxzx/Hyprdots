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

-- endregion
-- region tools

local wofi = "wofi --dmenu --normal-window --hide-scroll --insensitive --prompt=Search"
local hist = wofi .. [[ -W 800 -L 6 -r "echo '%s' | cut -f 2 | tr -d '\n' | head -c 80" ]]

wofi_apps = root .. "/wofi/run.sh '" .. wofi .. " -W 400 -L 6' " .. root .. "/wofi/app"
wofi_acts = root .. "/wofi/run.sh '" .. wofi .. " -W 400 -L 6' " .. root .. "/wofi/act"
wofi_hist =
[[
    killall wofi -s KILL
    cliphist list | ]] .. hist .. [[ | cliphist decode | wl-copy
]]

format_date = "date +'%A, the %-dxx of %B' | sed 's/11xx/11th/; s/12xx/12th/; s/13xx/13th/; s/1xx/1st/; s/2xx/2nd/; s/3xx/3rd/; s/xx/th/'"
format_time = "date +'%H:%M'"
format_both = "date +'%Y-%m-%d %H:%M:%S'"

notify_date = "hyprctl notify -1 4242 '" .. blue .. "' $(" .. format_date .. ")"
notify_time = "hyprctl notify -1 4242 '" .. blue .. "' $(" .. format_time .. ")"
notify_both = "hyprctl notify -1 4242 '" .. blue .. "' $(" .. format_both .. ")"

local screenshot =
[[
    hyprpicker -qrz &
    sleep .1
    hpid=$!
    rect=$(slurp -dF "Comic Sans MS" -b "#18182E52" -c "#BF90FB80")
    sleep .2
    grim -g "$rect"
]]

screenshot_copy = screenshot:sub(1, -2) .. [[ - | wl-copy ; kill $hpid ]]
screenshot_save = screenshot:sub(1, -2) .. [[ "screenshots/Screenshot of $( ]] .. format_both .. [[ ).png" ; kill $hpid ]]

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
