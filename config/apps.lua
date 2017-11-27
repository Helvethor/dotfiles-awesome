local apps = { }

apps.terminal = os.getenv("TERMCMD") or "urxvt"
apps.editor = apps.terminal .. " -e " .. os.getenv('EDITOR') or 'vim'
apps.htop = apps.terminal .. " -e htop"
apps.browser = "firefox"
apps.calendar = "gnome-calendar"
apps.mail = "geary"
apps.cloud = "nextcloud"
apps.volume = apps.terminal .. " -e pulsemixer"
apps.filemanager = apps.terminal .. " -e ranger"
apps.filemanager_gui = "nautilus"
apps.locker = "jautolock"
apps.compositor = "compton"

apps.boot = {
	apps.mail .. ' & ' .. apps.mail,
	apps.browser,
	apps.cloud,
	apps.terminal,
	apps.calendar,
	apps.locker,
	apps.compositor
}

function apps.spawn_once(command)
	local executable = command
	local firstspace = command:find(" ")
	if firstspace then
		executable = command:sub(1, firstspace-1)
	else
		executable = command
	end
	c.awful.spawn.with_shell(
		"pgrep -u $USER -x " .. executable .. " > /dev/null || "
		.. "(" .. command .. ")")
end

function apps.init()
	for _, app in pairs(apps.boot) do
		apps.spawn_once(app)
	end
end

return apps

-- vim: filetype=lua:foldmethod=marker
