hl.config
({
    general =
    {
        layout = "dwindle",
        no_focus_fallback = true,
    },

    dwindle =
    {
        force_split = 0,
        preserve_split = true,

        smart_split = true,
        smart_resizing = true,
    },

    input =
    {
        kb_layout = "us, ru", -- custom-us, custom-ru for mapping arrows to letters
        kb_options = "grp:shift_caps_toggle, grp:caps_toggle, grp_led:caps",

        accel_profile = "custom 0.2 0.0000 0.0285 0.1101 0.2330 0.3797 0.5293 0.6605 0.7725",

        numlock_by_default = true,
        follow_mouse = 1,
        focus_on_close = 1,
        mouse_refocus = true,
    },
})
