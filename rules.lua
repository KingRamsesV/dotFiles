-------------------
--- LAYER RULES ---
-------------------

-- blurred + low opacity layers

-- hl.layer_rule({
--   name = "noctalia",
--   match = { namespace = "^(noctalia-background-.*)$" },
--   blur = true,
--   blur_popups = true,
-- })
hl.layer_rule({
  match = { namespace = "^(quickshell:notifications:overlay|quickshell:osd|quickshell:sidebar|quickshell:popup)$" },
  blur = true,
})
hl.layer_rule({
  match = { namespace = "^(quickshell:notifications:overlay|quickshell:osd)$" },
  ignore_alpha = 0.2,
})
hl.layer_rule({
  match = { namespace = "^(quickshell:sidebar|quickshell:popup)$" },
  ignore_alpha = 0.5
})
hl.layer_rule({
  match = { namespace = "^quickshell.*$" },
  blur_popups = true,
})
hl.layer_rule({
  match = { namespace = "^(quickshell:bar)$" },
})
hl.layer_rule({
  match = { namespace = "^(quickshell:notifications:overlay|quickshell:sidebar|quickshell:popup)$" },
  no_anim = true,
})

-----------------------
--- WORKSPACE RULES ---
-----------------------

hl.workspace_rule({ workspace = "1", layout_opts = { orientation = "left" } })

--------------------
--- WINDOW RULES ---
--------------------

-- Bitwarden extension (Firefox, may not work)
hl.window_rule({ match = { title = "^(.*Bitwarden Password Manager.*)$" }, float = true})

-- Throw sharing indicator away
hl.window_rule({ match = { title = "^(Firefox — Sharing Indicator)$" }, workspace = "special silent" })

-- dim around dialogs - not sure if I have all of these
hl.window_rule({ match = { class = "^(gcr-prompter)$" }, dim_around = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, dim_around = true })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1)$" }, dim_around = true })
hl.window_rule({ match = { class = "^(firefox)$", title = "^(File Upload)$" }, dim_around = true })
