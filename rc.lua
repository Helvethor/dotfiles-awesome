c = {}

c.common = require("config.common")

c.awful = require("config.awful")
c.gears = require("gears")
c.wibox = require("wibox")
c.naughty = require("naughty")
c.vicious = require("vicious")

c.beautiful = require("config.beautiful")
c.beautiful.init()

c.errors = require("config.errors")
c.errors.init()

c.widgets = require("config.widgets")
c.layouts = require("config.layouts")
c.tags = require("config.tags")
c.bindings = require("config.bindings")

c.bindings.init()
c.widgets.init()

c.screen = require("config.screen")
c.screen.init()

c.signals = require("config.signals")
c.rules = require("config.rules")

c.apps= require("config.apps")
c.apps.init()

-- vim: filetype=lua:foldmethod=marker
