require("palette")
require("monitor")
require("input")
require("hyprfeel")
require("hyprbind")

hl.on("hyprland.start", function ()

    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")

    hl.exec_cmd("wl-paste --type text  --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

end)

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

hl.env("XCURSOR_THEME", "Bibata")
hl.env("XCURSOR_SIZE", "24")

hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
