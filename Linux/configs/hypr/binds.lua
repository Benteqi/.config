
local mainMod = "SUPER"

-- My programs
-- $fileManager = yazi
local menu = "wofi --show drun"
local terminal = "foot"
local browser = "librewolf"
-- Basics
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + C", hl.dsp.window.close() )
hl.bind(mainMod .. " + Q", hl.dsp.window.close() )
hl.bind(mainMod .. " + M", hl.dsp.exit() )
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen() )
hl.bind(mainMod .. " + W", hl.dsp.window.float() )
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo() ) -- dwindle 

-- Move focus with mainMod + vim motions
hl.bind(mainMod .. " + H", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + L", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + J", hl.dsp.focus({direction = "down"}))

-- Group binds
hl.bind(mainMod .. " + E", hl.dsp.group.toggle())
hl.bind(mainMod .. " + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + TAB",hl.dsp.group.prev())
hl.bind(mainMod .. " + up", hl.dsp.window.move({ into_group = "up" }))
hl.bind(mainMod .. " + right", hl.dsp.window.move({ into_group = "right" }))
hl.bind(mainMod .. " + down", hl.dsp.window.move({ into_group = "down" }))
hl.bind(mainMod .. " + left", hl.dsp.window.move({ into_group = "left" }))
hl.bind(mainMod .. " + up", hl.dsp.window.move({out_of_group = true}))

-- Hyprshot binds
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window -m active -o ~/Shots"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/Shots"))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1}))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2}))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3}))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4}))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5}))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6}))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7}))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8}))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9}))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10}))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1}))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2}))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3}))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4}))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5}))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6}))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7}))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8}))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9}))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10}))

-- Special workspace binds
--[[ 
hl.bind(mainMod .. " + S", togglespecialworkspace, magic)
hl.bind(mainMod .. " + SHIFT + S", movetoworkspace, special:magic)
--]]

-- Move/resize windows with mainMod + LMB/RMB and dragging
--[[ 
hl.bind(mainMod .. " + code:272", movewindow)
hl.bind(mainMod .. " + code:273", resizewindow)
--]]

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))

-- Requires playerctl
hl.bind(" XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind(" XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(" XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind(" XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
