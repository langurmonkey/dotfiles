-- ~/.dotfiles/hyprland/hosts/nvidia.lua
local nvidia = {}

function nvidia.apply()
    -- Environment variables recommended for Nvidia
    hl.env("LIBVA_DRIVER_NAME", "nvidia")
    hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
    hl.env("NVD_BACKEND", "direct")

    hl.config({
        cursor = {
            no_hardware_cursors = false,
            use_cpu_buffer = true
        }
    })

    -- Finally, load common settings
    require("common")
end
