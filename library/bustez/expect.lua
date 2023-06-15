---@meta

---@class bustez.Expectation
local Expectation = {}

Expectation.to = Expectation
Expectation.be = Expectation
Expectation.been = Expectation
Expectation.have = Expectation
Expectation.was = Expectation
Expectation.at = Expectation

---inverts the condition expressed by the expectation
Expectation.never = Expectation

---assert that our expectation value is the given type.
---@param typeName type
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(5).to.be.a("number")
---```
function Expectation.a(typeName, message) end

Expectation.an = Expectation.a

---assert that our expectation value is truthy
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(false).to.never.be.ok()
---```
function Expectation.ok(message) end

---assert that our expectation value is equal to another value
---@param otherValue any
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(1e3).to.equal(1000)
---```
function Expectation.equal(otherValue, message) end

---assert that our expectation value is equal to another value within some
---inclusive limit
---@param otherValue number
---@param limit? number -- (default `0.0000001`)
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(3.999).to.be.near(4, 0.01)
---```
function Expectation.near(otherValue, limit, message) end

---assert that our functoid expectation value throws an error when called
---
---An optional error message can be passed to assert that the error message
---contains the given value.
---@param messageSubstring? string
---@return bustez.Expectation self
---
---```lua
---local function fail()
---  error("{subtype}: oh no")
---end
---
---expect(fail).to.throw("{subtype}")
---expect(fail).to.throw("oh no")
---```
function Expectation.throw(messageSubstring) end

---assert that our expectation value "looks like" another value
---
---This is the same as equality for all values except tables, which are
---compared key-wise and value-wise.
---@param otherValue any
---@return bustez.Expectation self
---
---```lua
---local value = { 1, 2, 3 }
---expect(value).to.be.like({ 1, 2, 3 })
---```
function Expectation.like(otherValue) end

---a callable that returns an Expectation, which behaves like `assert`
---@class bustez.expect : bustez.Expectation
---@operator call(any): bustez.Expectation
local expect = {}

---@class bustez.Matcher.Result
---@field pass boolean
---@field message string

---@alias bustez.Matcher fun(state: table, arguments: any[], level: integer): boolean

---takes a table of matchers and extends `expect` and `luassert` to support it
---@param matchers { [string]: bustez.Matcher }
---
---```lua
---say:set("assertion.exist.positive", "Expected %s \nto exist")
---say:set("assertion.exist.negative", "Expected %s \nto not exist")
---
------@class bustez.Expectation
------asserts that our expectation is not `nil`
------@field exist fun(): bustez.Expectation
---
---expect.extend({
---  exist = function(state, arguments, level)
---    return arguments[1] ~= nil
---  end,
---})
---
---expect(false).to.exist()
---```
function expect.extend(matchers) end

return expect
