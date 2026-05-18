


-- mouse movements
hl.bind(Mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(Mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(Mod .. " + ALT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- compositor commands
hl.bind(Mod .. " + SHIFT + E", hl.dsp.exec_cmd("pkill Hyprland"))
hl.bind(Mod .. " + Q", hl.dsp.window.close())
hl.bind(Mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(Mod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(Mod .. " + G", hl.dsp.group.toggle())
-- hl.bind(Mod .. " + SHIFT + N", hl.dsp.group.next())
-- hl.bind(Mod .. " + SHIFT + P", hl.dsp.group.previous())
hl.bind(Mod .. " + R", hl.dsp.layout("togglesplit"))
hl.bind(Mod .. " + P", hl.dsp.window.pseudo())
hl.bind(Mod .. " + A", hl.dsp.exec_cmd("hyprlauncher"))

-- utility/applications
hl.bind(Mod .. " + T", hl.dsp.exec_cmd("kitty -o allow_remote_control=yes"))
hl.bind(Mod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(Mod .. " + B", hl.dsp.exec_cmd("firefox"))

-- move focus
hl.bind(Mod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(Mod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(Mod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(Mod .. " + down", hl.dsp.focus({ direction = "d" }))

-- workspaces 1-10
for i = 1, 10 do
  local key = i % 10
  hl.bind(Mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(Mod .. " + SHIFT +  " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(Mod .. " + S", hl.dsp.layout("swapwithmaster"))

