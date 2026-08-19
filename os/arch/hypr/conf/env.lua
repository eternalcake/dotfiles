local M = {}

M.terminal = "ghostty"
M.cursorTheme = "Bibata-Modern-Classic"
M.cursorSize = "16"

hl.env("TERMINAL", M.terminal)

hl.env("CURSOR_THEME", M.cursorTheme)
hl.env("CURSOR_SIZE", M.cursorSize)
hl.env("XCURSOR_THEME", M.cursorTheme)
hl.env("XCURSOR_SIZE", M.cursorSize)
hl.env("HYPRCURSOR_THEME", M.cursorTheme)
hl.env("HYPRCURSOR_SIZE", M.cursorSize)

-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("WLR_NO_HARDWARE_CURSOR", "1")
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card1")

return M
