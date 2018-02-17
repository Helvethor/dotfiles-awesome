local common = {}

common.homedir = os.getenv("HOME")
common.confdir = common.homedir .. "/.config/awesome"
common.screenshotdir = common.homedir .. "/media/pictures/screenshots"
common.themedir = common.confdir .. "/themes/flexible"
common.themefile = common.themedir .. "/theme.lua"
common.lockscript = common.homedir .. "/.config/i3lock-color/downsample.sh"

common.hostname = io.popen("hostname"):read()

common.modkey = "Mod4"
common.altkey = "Mod1"
common.shiftkey= "Shift"
common.ctrlkey= "Control"
common.spacekey= "space"

function common.pprint(o, max_depth, depth)
	local s
	depth = depth or 0
	max_depth = max_depth or 1

	if depth >= max_depth then
		s = tostring(o)
	elseif type(o) == 'table' then
		s = '{\n'
		for k, v in pairs(o) do
			for i = 0, depth do
				s = s .. '  '
			end
			v = common.pprint(v, max_depth, depth + 1)
			s = s .. tostring(k) .. ': ' .. v .. '\n'
		end
		s = s ..  '}'
	else
		s = tostring(o)
	end

	return s
end

function common.quicknote(o, max_depth)
	local s = common.pprint(o, max_depth or 4, 0)
	c.naughty.notify({ 
		preset = c.naughty.config.presets.debug,
		text = s
	})
end

return common

-- vim: filetype=lua:foldmethod=marker
