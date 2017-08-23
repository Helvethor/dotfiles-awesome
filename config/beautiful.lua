local beautiful = require("beautiful")
local oldinit = beautiful.init

function beautiful.init()
	oldinit(c.common.themefile)
end

return beautiful

-- vim: filetype=lua:foldmethod=marker
