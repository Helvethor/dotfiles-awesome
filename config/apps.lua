local apps = { }

function apps.vte(cmd)
    if apps.terminal == 'termite' then
        return apps.terminal .. ' -e "' .. cmd .. '"'
    elseif apps.terminal == 'urxvt' then
        return apps.terminal .. ' -e ' .. cmd
    end
end

apps.terminal = os.getenv("TERMCMD") or "termite"
apps.editor = apps.vte(os.getenv('EDITOR') or 'vim')
apps.htop = apps.vte('htop')
apps.firefox = "firefox"
apps.browser = "qutebrowser"
apps.calendar = "gnome-calendar"
apps.mail = "geary"
apps.cloud = "nextcloud"
apps.volume = apps.vte('pulsemixer')
apps.filemanager = apps.vte('ranger')
apps.filemanager_gui = "nautilus"
apps.locker = "jautolock"
apps.compositor = "compton"
apps.keyboard = "gkbd"

apps.boot = {
	apps.mail .. ' & ' .. apps.mail,
	apps.browser,
	apps.cloud,
--	apps.terminal,
	apps.calendar,
	apps.locker,
	apps.compositor,
	apps.keyboard
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

function apps.vte(cmd)
    if apps.terminal == 'termite' then
        return apps.terminal .. ' -e "' .. cmd .. '"'
    elseif apps.terminal == 'urxvt' then
        return apps.terminal .. ' -e ' .. cmd
    end
end

return apps

-- vim: filetype=lua:foldmethod=marker
