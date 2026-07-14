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

return M
