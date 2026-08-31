-- region general

hl.config
({
    general =
    {
        gaps_in = 6,
        gaps_out = 14,

        col =
        {
            active_border = { colors = { blue .. "EE", pink .. "EE" }, angle = 135 },
            inactive_border = blue .. "00",
        },
        border_size = 2,
    },

    decoration =
    {
        rounding = 8,
        rounding_power = 3,

        active_opacity = 1,
        inactive_opacity = 0.8,

        blur =
        {
            enabled = true,

            size = 2,
            passes = 4,
            contrast = 1,
            brightness = 0.8,
        },

        shadow =
        {
            enabled = false,
        },
    },

    misc =
    {
        font_family = "Comic Sans MS",
    },
})

-- endregion
-- region animations

hl.curve("line", { type = "bezier", points = { { 0.0, 0.7 }, { 0.3, 1.00 } } })
hl.curve("over", { type = "bezier", points = { { 0.0, 0.8 }, { 0.2, 1.06 } } })

hl.animation
({
    leaf = "windows",
    enabled = true,

    speed = 6,
    bezier = "over",
})

hl.animation
({
    leaf = "windowsOut",
    enabled = true,

    speed = 6,
    bezier = "over", style = "popin 80%",
})

hl.animation
({
    leaf = "workspaces",
    enabled = true,

    speed = 6,
    bezier = "line",
})

hl.animation
({
    leaf = "border",
    enabled = true,

    speed = 8,
    bezier = "line",
})

hl.animation
({
    leaf = "fade",
    enabled = true,

    speed = 8,
    bezier = "line",
})

hl.animation
({
    leaf = "fadeLayers",
    enabled = true,

    speed = 2,
    bezier = "line",
})

-- endregion
