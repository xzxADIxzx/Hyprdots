-- region general

hl.bind("SUPER +         Q", hl.dsp.exec_raw(wofi_apps))
hl.bind("SUPER +         M", hl.dsp.exec_raw(wofi_acts))
hl.bind("SUPER +         V", hl.dsp.exec_raw(wofi_hist))

hl.bind("SUPER +         R", hl.dsp.exec_raw("kitty"))
hl.bind("SUPER +         P", hl.dsp.exec_raw("hyprpicker -qraf hex"))
hl.bind("SUPER +         L", hl.dsp.exec_raw("loginctl lock-session"))

hl.bind("SUPER +         E", hl.dsp.exec_raw(notify_time))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_raw(notify_date))

hl.bind("SUPER         + S", hl.dsp.exec_raw(screenshot_copy))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_raw(screenshot_save))

hl.bind("SUPER +         F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER +         C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + C", hl.dsp.window.kill())

-- endregion
-- region windows

hl.bind("SUPER + mouse:272", hl.dsp.window.drag  (), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

for _, d in pairs({ "up", "right", "down", "left" })
do
    hl.bind("SUPER + " .. d, hl.dsp.focus({ direction = d }))
end

-- endregion
-- region workspaces

for i = 1, 4
do
    hl.bind("SUPER +         " .. i, hl.dsp.focus      ({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- endregion
-- region multimedia

hl.bind("XF86MonBrightnessUp  ", brightness_inc, { repeating = true })
hl.bind("XF86MonBrightnessDown", brightness_dec, { repeating = true })

hl.bind("XF86AudioRaiseVolume", volume_inc, { repeating = true })
hl.bind("XF86AudioLowerVolume", volume_dec, { repeating = true })
hl.bind("XF86AudioMute", volume_tgl)

hl.bind("print", hl.dsp.send_shortcut({ mods = "CTRL + SHIFT", key = "M", window = "class:discord" }))

-- endregion
