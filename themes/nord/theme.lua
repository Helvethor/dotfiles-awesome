---------------------------
-- Arc awesome theme --
---------------------------

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua

theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/nord/"
theme = {}
-- theme.font = "sans 8"
-- theme.font = "Misc Termsynu 8"
-- theme.font = "tamzen 8"
theme.font = "dina 8"
-- theme.font = "Fira Mono 10"
-- theme.font = "xos4 terminus 8"
theme.color = {}

-- Nord Colors
theme.color.nord0      = "#2E3440"
theme.color.nord1      = "#3B4252"
theme.color.nord2      = "#434C5E"
theme.color.nord3      = "#4C566A"
theme.color.nord4      = "#D8DEE9"
theme.color.nord5      = "#E5E9F0"
theme.color.nord6      = "#ECEFF4"
theme.color.nord7      = "#8FBCBB"
theme.color.nord8      = "#88C0D0"
theme.color.nord9      = "#81A1C1"
theme.color.nord10     = "#5E81AC"
theme.color.nord11     = "#BF616A"
theme.color.nord12     = "#D08770"
theme.color.nord13     = "#EBCB8B"
theme.color.nord14     = "#A3BE8C"
theme.color.nord15     = "#B48EAD"

-- Named colors
theme.color.black      = "#000000"
theme.color.white      = "#FFFFFF"
theme.color.dark       = theme.color.nord1
theme.color.darker     = theme.color.nord0
theme.color.red        = theme.color.nord11
theme.color.green      = theme.color.nord14
theme.color.blue       = theme.color.nord9
theme.color.light_gray = theme.color.nord5
theme.color.gray       = "#858c98"
theme.color.arc_darker = "#2f343f"
theme.color.arc_dark   = "#3e424d"

-- Common theme settings
theme.bg_normal     = theme.color.darker
theme.bg_focus      = theme.color.dark
theme.bg_urgent     = theme.color.red
theme.bg_minimize   = theme.color.arc_dark
theme.bg_systray    = theme.color.arc_darker

theme.fg_normal     = theme.color.white
theme.fg_focus      = theme.color.white
theme.fg_urgent     = theme.color.black
theme.fg_minimize   = "#666c7e"

theme.border_width  = 1
theme.border_normal = theme.color.dark
theme.border_focus  = theme.color.green
theme.border_marked = theme.color.blue

-- Wibar colors
theme.wibar_bg = theme.bg_normal

-- Widget colors
theme.widget_bg = theme.bg_focus

-- Tooltip settings
theme.tooltip_opacity      = 1
theme.tooltip_border_width = 1
theme.tooltip_border_color = theme.border_focus
theme.tooltip_bg_color     = theme.bg_focus
theme.tooltip_fg_color     = theme.fg_focus

-- Notification settings
theme.naughty_opacity      = 1
theme.naughty_border_width = theme.border_width
theme.naughty_border_color = theme.border_focus
theme.naughty_bg_color     = theme.bg_focus
theme.naughty_fg_color     = theme.fg_focus

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:

-- Display the taglist squares
theme.taglist_squares_sel   = theme_dir .. "taglist/squarefw-thin.png"
theme.taglist_squares_unsel = theme_dir .. "taglist/squarew-thin.png"
theme.taglist_fg_focus = theme.fg_focus
theme.taglist_bg_focus = theme.color.green

-- Tasklist coloring
theme.tasklist_disable_icon = true
-- theme.tasklist_disable_task_name = true
-- theme.tasklist_minimal_task_name = true
-- theme.tasklist_plain_task_name = true
theme.tasklist_fg_focus = theme.color.fg_focus
theme.tasklist_bg_focus = theme.color.green
theme.tasklist_bg_normal = theme.widget_bg

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme_dir .. "submenu.png"
theme.menu_height = 15
theme.menu_width  = 100
theme.menu_border_width = 0 or theme.border_width

-- Wallpaper
-- theme.wallpaper = theme_dir .. "wallpaper.png"
theme.wallpaper = theme_dir .. "wallpaper.png"

-- You can use your own layout icons like this:
theme.layout_fairh      = theme_dir .. "layouts/fairhw-mono-small.png"
theme.layout_fairv      = theme_dir .. "layouts/fairvw-mono-small.png"
theme.layout_centerfair = theme_dir .. "layouts/centerfair.png"
theme.layout_floating   = theme_dir .. "layouts/floatingw.png"
theme.layout_magnifier  = theme_dir .. "layouts/magnifierw-mono-small.png"
theme.layout_max        = theme_dir .. "layouts/maxw.png"
theme.layout_fullscreen = theme_dir .. "layouts/fullscreenw.png"
theme.layout_tilebottom = theme_dir .. "layouts/tilebottomw.png"
theme.layout_tileleft   = theme_dir .. "layouts/tileleftw.png"
theme.layout_tile       = theme_dir .. "layouts/tilew-mono-small.png"
theme.layout_tiletop    = theme_dir .. "layouts/tiletopw.png"
theme.layout_spiral     = theme_dir .. "layouts/spiralw.png"
theme.layout_dwindle    = theme_dir .. "layouts/dwindlew.png"

-- gap width
theme.useless_gap = 10

-- icons for launcher widget
theme.awesome_icon     = theme_dir .. "icons/awesome16.png"
theme.reboot_icon      = theme_dir .. "icons/reboot.png"
theme.shutdown_icon    = theme_dir .. "icons/shutdown.png"
theme.suspend_icon     = theme_dir .. "icons/suspend.png"

-- Notification icons
theme.low_battery_icon     = theme_dir .. "icons/battery-warning.svg"
theme.screenshot_icon      = theme_dir .. "icons/screenshooter.svg"
theme.icon_notify_enabled  = theme_dir .. "icons/notification-symbolic.svg"
theme.icon_notify_disabled = theme_dir .. "icons/notification-disabled-symbolic.svg"

-- Define the icon theme for application icons. If not set then the icons
-- in /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Paper"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:foldmethod=marker
