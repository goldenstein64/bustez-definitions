---@meta

---Returns an Expectation, which behaves like `assert`
---@alias expect fun(value: any): Expectation

local expect = require("bustez.expect")
local register = require("bustez.register")

---The BustEZ module
---@class bustez
---@overload fun(): expect
local bustez = {}

---@type expect
bustez.expect = expect
bustez.register = register

return bustez