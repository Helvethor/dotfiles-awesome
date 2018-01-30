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

function theme.iconify(value, color, avoid_nofocus)
    local color = color or theme.fg_alt
    if color == theme.nofocus and avoid_nofocus then
        color = theme.fg_alt
    end
	return "<span font-family='Wuncon Siji'"
		.. " color='" .. color .. "'>" 
		.. utf8.char(value) .. "</span>"
end

-- }}}

-- {{{ Guides
--
theme.color.black       = "#0a0f14"
theme.color.black_hg    = "#0e1218"
theme.color.red         = "#c23127"
theme.color.red_hg      = "#d26937"
theme.color.green       = "#2aa889"
theme.color.green_hg    = "#3ebf9f"
theme.color.yellow      = "#edb443"
theme.color.yellow_hg   = "#ffdb92"
theme.color.blue        = "#195466"
theme.color.blue_hg     = "#23768e"
theme.color.magenta     = "#888ca6"
theme.color.magenta_hg  = "#a9a6bd"
theme.color.cyan        = "#33859e"
theme.color.cyan_hg     = "#64abbf"
theme.color.white       = "#99d1ce"
theme.color.white_hg    = "#d3ebe9"

theme.bg		= "#0a0f14"
theme.bg_alt	= "#0e1218"

theme.fg		= "#99d1ce"
theme.fg_alt	= "#d3ebe9"

theme.success   = "#2aa889"
theme.warning   = "#d26937"
theme.warn		= theme.warning
theme.danger    = "#c23127"

theme.nofocus	= "#195466"
theme.focus		= "#64abbf"
theme.mark		= "#a9a6bd"
theme.urgent	= "#d26937"
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
theme.tooltip_border_color	= theme.urgent
theme.tooltip_bg_color		= theme.bg
theme.tooltip_fg_color		= theme.fg
-- }}}

-- {{{ Taglist
theme.taglist_fg_focus      = theme.fg_alt
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
theme.notification_border_color	= theme.urgent
theme.notification_bg_color		= theme.bg
theme.notification_fg_color		= theme.fg
-- }}}

-- {{{ Layoutbox
theme.layout = { icons = {}, shortnames = {}, colors = {} }

theme.layout.icons.tile			= 0x00e009
theme.layout.icons.tileleft		= 0x00e009
theme.layout.icons.tilebottom	= 0x00e00a
theme.layout.icons.fairv		= 0x00e005
theme.layout.icons.magnifier	= 0x00e001

theme.layout.colors.tile		= theme.color.red
theme.layout.colors.tileleft	= theme.color.yellow
theme.layout.colors.tilebottom	= theme.color.green
theme.layout.colors.fairv		= theme.color.cyan
theme.layout.colors.magnifier	= theme.color.blue


theme.layout.shortnames.tile        = "TR"
theme.layout.shortnames.tileleft    = "TL"
theme.layout.shortnames.tilebottom  = "TB"
theme.layout.shortnames.fairv       = "FV"
theme.layout.shortnames.magnifier   = "MG"
-- }}}

-- }}}

return theme

-- vim: filetype=lua:shiftwidth=4:tabstop=4:softtabstop=4:foldmethod=marker
