------------------
---- MONITORS ----
------------------
hl.monitor({
	output = "",
	mode = "2880x1800@120",
	position = "auto",
	scale = 1.8,
})

-------------------------
---- SUB-CONFIG FILES ----
-------------------------
local env = require("conf.env")
require("conf.keybinding")
require("conf.animation")
require("conf.decoration")

-------------------
---- AUTOSTART ----
-------------------
-- loadfile(os.getenv("HOME") .. "/.local/share/ambxst/hyprland.lua")()

hl.on("hyprland.start", function()
	-- hl.exec_cmd("noctalia")
	hl.exec_cmd(env.terminal)
	-- hl.exec_cmd("hyprpanel")
	-- hl.exec_cmd("hypridle")
	-- hl.exec_cmd("hyprpaper")
	-- loadfile(os.getenv("HOME") .. "/.local/share/ambxst/hyprland.lua")()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("hyprctl setcursor " .. env.cursorTheme .. " " .. env.cursorSize)
	hl.exec_cmd("[workspace 2 silent] google-chrome")
	hl.exec_cmd("[workspace 10 silent] materialgram")
end)

hl.config({
	xwayland = { force_zero_scaling = true },
	input = {
		kb_layout = "us,ru",
		kb_options = "grp:caps_toggle",
		follow_mouse = 1,
		repeat_delay = 200,
		repeat_rate = 60,
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.15,
		},
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	cursor = {
		hide_on_key_press = true,
	},

	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
		-- enforce_permissions = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},
})

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	match = { class = "chromium" },
	opacity = "0.9",
})

hl.window_rule({
	match = { class = "google-chrome" },
	opacity = "0.9",
})

hl.window_rule({
	match = { title = "materialgram" },
	opacity = "0.9",
})

hl.window_rule({
	match = { class = "md.obsidian.Obsidian" },
	opacity = "0.9",
})

hl.window_rule({
	match = { class = "com.mitchellh.ghostty" },
	opacity = "0.9",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})
