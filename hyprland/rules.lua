hl.window_rule
({
    match =
    {
        class = "(?i).*menu.*",
    },
    float = true,
    pin = true,
    stay_focused = true,
    size = "432 180",
})

hl.window_rule
({
    match =
    {
        class = "(?i).*menu-(hist|calc).*",
    },
    size = "1152 180",
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
