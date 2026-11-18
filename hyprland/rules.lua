hl.window_rule
({
    match =
    {
        class = "(?i).*wofi.*",
    },
    stay_focused = true,
})

hl.window_rule
({
    match =
    {
        class = "(?i).*kitty.*",
    },
    suppress_event = "fullscreen maximize",
})

hl.window_rule
({
    match =
    {
        class = "(?i).*chrome.*",
    },
    no_auto_hdr = true,
})

hl.window_rule
({
    match =
    {
        class = "(?i).*vscode.*",
    },
    no_auto_hdr = true,
})
