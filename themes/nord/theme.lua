local gears = require("gears")
theme = {}
theme.dir = c.common.themedir
theme.color	= {}

-- {{{ Miscellaneous
-- {{{ Other fonts
-- theme.font	= "sans 8"
-- theme.font	= "Misc Termsynu 8"
-- theme.font	= "tamzen 8"
-- theme.font	= "Fira Mono 10"
-- theme.font	= "xos4 terminus 8"
-- theme.font	= "Source Code Pro 12px"
-- }}}
theme.font = "dina 8"
theme.icon_theme = "Paper"
theme.wallpaper = theme.dir .. "/wallpaper.png"

function theme.iconify(value)
	return "<span font-family='Wuncon Siji'"
		.. " color='" .. theme.fg_alt .. "'>" 
		.. utf8.char(value) .. "</span>"
end

-- }}}

-- {{{ Colors

-- {{{ Nord Theme
theme.color.nord0	= "#2E3440"
theme.color.nord1	= "#3B4252"
theme.color.nord2	= "#434C5E"
theme.color.nord3	= "#4C566A"
theme.color.nord4	= "#D8DEE9"
theme.color.nord5	= "#E5E9F0"
theme.color.nord6	= "#ECEFF4"
theme.color.nord7	= "#8FBCBB"
theme.color.nord8	= "#88C0D0"
theme.color.nord9	= "#81A1C1"
theme.color.nord10	= "#5E81AC"
theme.color.nord11	= "#BF616A"
theme.color.nord12	= "#D08770"
theme.color.nord13	= "#EBCB8B"
theme.color.nord14	= "#A3BE8C"
theme.color.nord15	= "#B48EAD"
-- }}}

-- {{{ Palette
theme.color.black	= "#000000"
theme.color.white	= "#FFFFFF"

theme.color.polar0	= theme.color.nord0
theme.color.polar1	= theme.color.nord1
theme.color.polar2	= theme.color.nord2
theme.color.polar3	= theme.color.nord3

theme.color.snow0	= theme.color.nord4
theme.color.snow1	= theme.color.nord5
theme.color.snow2	= theme.color.nord6

theme.color.frost0	= theme.color.nord7
theme.color.frost1	= theme.color.nord8
theme.color.frost2	= theme.color.nord9
theme.color.frost3	= theme.color.nord10

theme.color.aurora0	= theme.color.nord11
theme.color.aurora1	= theme.color.nord12
theme.color.aurora2	= theme.color.nord13
theme.color.aurora3	= theme.color.nord14
theme.color.aurora4	= theme.color.nord15
-- }}}

-- {{{ Guides
theme.bg		= theme.color.polar0
theme.bg_alt	= theme.color.polar1

theme.fg		= theme.color.snow0
theme.fg_alt	= theme.color.polar3

theme.primary	= theme.color.aurora3
theme.secondary	= theme.color.aurora2

theme.nofocus	= theme.color.frost3
theme.focus		= theme.color.aurora3
theme.warn		= theme.color.aurora2
theme.mark		= theme.color.aurora4
theme.urgent	= theme.color.aurora0
-- }}}

-- }}}

-- {{{ Settings

-- {{{ Global
theme.display_unit	= 15
theme.margin		= theme.display_unit
theme.opacity		= 1
theme.border_width	= 2
theme.bg_normal = theme.bg
theme.fg_normal = theme.fg
theme.useless_gap	= theme.display_unit
-- }}}

-- {{{ Wibar
theme.wibar_bg		= theme.bg
theme.wibar_fg		= theme.fg
theme.wibar_height	= theme.display_unit * 2
-- }}}

-- {{{ Widgets
theme.widgets_bg			= theme.bg
theme.widgets_fg			= theme.fg
theme.widgets_border_color	= theme.nofocus
theme.widgets_border_width	= theme.border_width
-- }}}

-- {{{ Tooltip
theme.tooltip_opacity		= theme.opacity
theme.tooltip_border_width	= theme.border_width
theme.tooltip_border_color	= theme.focus
theme.tooltip_bg_color		= theme.bg
theme.tooltip_fg_color		= theme.fg
-- }}}

-- {{{ Taglist
theme.taglist_bg_selected	= theme.bg_alt
theme.taglist_bg			= theme.bg

theme.taglist_border_focus		= theme.focus
theme.taglist_border_occupied	= theme.focus
theme.taglist_border_empty		= theme.nofocus
theme.taglist_border_volatile	= theme.mark
theme.taglist_border_urgent		= theme.urgent
-- }}}

-- {{{ Notification
theme.notification_opacity		= theme.opacity
theme.notification_margin		= theme.margin
theme.notification_border_width	= theme.border_width
theme.notification_border_color	= theme.focus
theme.notification_bg_color		= theme.bg
theme.notification_fg_color		= theme.fg
-- }}}

-- {{{ Layoutbox
theme.layout_fairh		= theme.dir .. "layouts/fairhw-mono-small.png"
theme.layout_fairv		= theme.dir .. "layouts/fairvw-mono-small.png"
theme.layout_centerfair	= theme.dir .. "layouts/centerfair.png"
theme.layout_floating	= theme.dir .. "layouts/floatingw.png"
theme.layout_magnifier	= theme.dir .. "layouts/magnifierw-mono-small.png"
theme.layout_max		= theme.dir .. "layouts/maxw.png"
theme.layout_fullscreen	= theme.dir .. "layouts/fullscreenw.png"
theme.layout_tilebottom	= theme.dir .. "layouts/tilebottomw.png"
theme.layout_tileleft	= theme.dir .. "layouts/tileleftw.png"
theme.layout_tile		= theme.dir .. "layouts/tilew-mono-small.png"
theme.layout_tiletop	= theme.dir .. "layouts/tiletopw.png"
theme.layout_spiral		= theme.dir .. "layouts/spiralw.png"
theme.layout_dwindle	= theme.dir .. "layouts/dwindlew.png"

theme.layout_repr_tile			= theme.iconify(0x00e009) .. " TR"
theme.layout_repr_tileleft		= theme.iconify(0x00e009) .. " TL"
theme.layout_repr_tilebottom	= theme.iconify(0x00e00a) .. " TB"
theme.layout_repr_fairv			= theme.iconify(0x00e005) .. " FV"
theme.layout_repr_magnifier		= theme.iconify(0x00e001) .. " MG"
-- }}}

-- }}}

return theme

-- vim: filetype=lua:shiftwidth=4:tabstop=4:softtabstop=4:foldmethod=marker
