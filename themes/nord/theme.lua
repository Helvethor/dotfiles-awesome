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
theme.wallpaper_dir = theme.dir .. "/wallpapers"
theme.wallpaper = theme.wallpaper_dir .. "/wallpaper"

function theme.iconify(value)
	return "<span font-family='Wuncon Siji'"
		.. " color='" .. theme.fg_alt .. "'>" 
		.. utf8.char(value) .. "</span>"
end

-- }}}

-- {{{ Guides
--
theme.color.black	= "#000000"
theme.color.white	= "#FFFFFF"

theme.bg		= "#2E3440"
theme.bg_alt	= "#3B4252"

theme.fg		= "#D8DEE9"
theme.fg_alt	= "#4C566A"

theme.primary	= "#A3BE8C"
theme.secondary	= "#EBCB8B"

theme.nofocus	= "#5E81AC"
theme.focus		= "#A3BE8C"
theme.warn		= "#EBCB8B"
theme.mark		= "#B48EAD"
theme.urgent	= "#BF616A"
-- }}}

-- }}}

-- {{{ Settings

-- {{{ Global
theme.display_unit	= 15
theme.margin		= theme.display_unit
theme.opacity		= 1
theme.border_width	= 2
theme.bg_normal		= theme.bg
theme.fg_normal		= theme.fg
theme.gap			= theme.display_unit * 1
theme.useless_gap	= theme.gap / 2
-- }}}

-- {{{ Wibar
theme.wibar_bg		= theme.bg
theme.wibar_fg		= theme.fg
theme.wibar_margin	= theme.gap
theme.wibar_height	= theme.display_unit * 2
theme.wibar_width	= function(w) return w - 2 * theme.wibar_margin end
theme.wibar_x		= function(ox) return ox + theme.wibar_margin end
theme.wibar_y		= function(oy) return oy + theme.wibar_margin end
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
