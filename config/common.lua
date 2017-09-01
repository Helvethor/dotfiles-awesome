local common = {}

common.homedir = os.getenv("HOME")
common.confdir = common.homedir .. "/.config/awesome"
common.themedir = common.confdir .. "/themes/nord"
common.themefile = common.themedir .. "/theme.lua"

common.hostname = io.popen("hostname"):read()

common.modkey = "Mod4"
common.altkey = "Mod1"
common.shiftkey= "Shift"
common.ctrlkey= "Control"
common.spacekey= "space"

return common

-- vim: filetype=lua:foldmethod=marker
