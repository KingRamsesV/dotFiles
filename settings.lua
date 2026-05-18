------------------------
--- ENVIRONMENT VARS ---
------------------------

hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("HYPRCURSOR_THEME", CursorName)
hl.env("HYPRCURSOR_SIZE", CursorSize)
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDER_LIBRARY_NAME", "nvidia")

---------------
--- STARTUP ---
---------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprctl setcursor " .. CursorName .. " " .. CursorSize)
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("quickshell -p ~/shell/shell.qml")
end)

------------------------
--- GENERAL SETTINGS ---
------------------------

hl.config({
  general = {
    gaps_in = gaps_in,
    gaps_out = gaps_out,
    border_size = 1,
    col = {
      active_border = "rgba(88888888)",
      inactive_border = "rgba(00000088)",
    },
    allow_tearing = true,
    resize_on_border = true,
  },

  decoration = {
    rounding = 10,
    rounding_power = 2.5,
    blur = {
      enabled = true,
      brightness = 1.0,
      contrast = 1.0,
      noise = 0.01,
      vibrancy = 0.2,
      vibrancy_darkness = 0.5,
      passes = 4,
      size = 7,
      popups = true,
      popups_ignorealpha = 0.2,
    },
    shadow = {
      enabled = true,
      color = "rgba(00000055)",
      offset = { 0, 15 },
      range = 100,
      render_power = 2,
      scale = 0.97,
    },
  },

  animations = {
    enabled = true,
  },

  group = {
    groupbar = {
      font_size = 10,
      gradients = false,
      text_color = TextColor,
    },
    col = {
      border_active = BorderActiveColor,
      border_inactive = BorderInactiveColor,
    },
  },

  input = {
    touchpad = {
      natural_scroll = true,
    },
    follow_mouse = 1,
    focus_on_close = 1,
    accel_profile = "flat",
    kb_options = "caps:swapescape",
  },

  dwindle = {
    preserve_split = true,
  },

  misc = {
    force_default_wallpaper = 0,
    animate_mouse_windowdragging = false,
    vrr = 1,
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    focus_on_activate = true,
  },

  render = {
    direct_scanout = true,
  },

  gestures = {
    workspace_swipe_forever = true,
  },

  xwayland = {
    force_zero_scaling = true,
  },
})

----------------
--- GESTURES ---
----------------

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
