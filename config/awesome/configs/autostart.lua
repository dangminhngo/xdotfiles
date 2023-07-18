local awful = require("awful")
local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local helpers = require("helpers")

local function autostart()
	--- Compositor
	helpers.run.check_if_running("picom", nil, function()
		awful.spawn("picom --experimental-backends --config " .. config_dir .. "configs/picom.conf", false)
	end)
	--- Polkit Agent
	helpers.run.run_once_ps("polkit-kde-authentication-agent-1", "/usr/lib/polkit-kde-authentication-agent-1")
	-- Screen
	helpers.run.run_once_grep("xset s off && xset s noblank && xset -dpms")
	-- Inputs
	helpers.run.run_once_grep("xset r rate 400 50")
	--- Other stuff
	helpers.run.run_once_grep("blueman-applet")
	helpers.run.run_once_grep("nm-applet")
	-- Idle manager
	helpers.run.run_once_grep(
		[[xautolock -time 10 -locker awesome-client "require('modules.lockscreen.lockscreen')()" -killtime 15 -killer xset dpms force off]]
	)
end

autostart()
