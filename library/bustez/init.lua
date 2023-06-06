---@meta

---The BustEZ module
---@class bustez
---@operator call: bustez.expect
local bustez = {
	expect = require("bustez.expect"),
	register = require("bustez.register"),
}

return bustez
