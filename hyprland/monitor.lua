hl.monitor
({
    output = "DP-1",
    mode = "2560x1440@180",
})

hl.config
({
    misc =
    {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,

        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },

    render =
    {
        direct_scanout = 1,
    },

    cursor =
    {
        no_hardware_cursors = 0,
    },
})
