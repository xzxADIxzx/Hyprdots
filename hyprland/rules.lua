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
    immediate = false,
    no_auto_hdr = true,
})

hl.window_rule
({
    match =
    {
        class = "(?i).*vscode.*",
    },
    immediate = false,
    no_auto_hdr = true,
})
