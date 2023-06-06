---@meta

---Returns an Expectation, which behaves like `assert`
---@alias bustez.expect fun(value: any): bustez.Expectation

local expect = require("bustez.expect")
local register = require("bustez.register")

---The BustEZ module
---@class bustez
---@overload fun(): bustez.expect
local bustez = {}

---@type bustez.expect
bustez.expect = expect
bustez.register = register

return bustez