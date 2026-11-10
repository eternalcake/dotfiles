--------------------
---- DECORATION ----
--------------------
hl.config({
  general = {
    border_size = 0,
    col = {
      active_border = "rgba(88888888)",
    },
    gaps_in  = 1,
    resize_on_border        = true,
    extend_border_grab_area = 15,
    gaps_out = {
        top = 0,
        left = 0,
        right = 0,
        bottom = 0
    }
  },

  decoration = {
    rounding        = 21,
    rounding_power  = 2,
    active_opacity  = 1.0,
    inactive_opacity = 1.0,
    dim_inactive    = true,
    dim_strength    = 0.2,

    blur = {
      enabled            = true,
      size               = 8,
      passes             = 5,
      noise              = 0.1,
      contrast           = 1.0,
      brightness         = 1.1,
      vibrancy           = 1.0,
      new_optimizations  = true,
      ignore_opacity     = true,
    },

    shadow = {
      enabled = false,
    },
  },
})
