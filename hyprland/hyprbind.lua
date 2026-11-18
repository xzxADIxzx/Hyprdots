-- region general

hl.bind("SUPER +         Q", wofi_apps)
hl.bind("SUPER +         M", wofi_acts)
hl.bind("SUPER +         V", wofi_hist)

hl.bind("SUPER +         R", term)
hl.bind("SUPER +         P", pick)
hl.bind("SUPER +         L", lock)

hl.bind("SUPER +         E", notify_time)
hl.bind("SUPER + SHIFT + E", notify_date)

hl.bind("SUPER         + S", screenshot_copy)
hl.bind("SUPER + SHIFT + S", screenshot_save)

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
hl.bind("XF86AudioMute       ", volume_tgl)

hl.bind("print", hl.dsp.send_shortcut({ mods = "CTRL + SHIFT", key = "M", window = "class:discord" }))

-- endregion
