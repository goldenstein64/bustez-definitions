---@meta

---@class Expectation
local Expectation = {}

Expectation.to = Expectation
Expectation.be = Expectation
Expectation.been = Expectation
Expectation.have = Expectation
Expectation.was = Expectation
Expectation.at = Expectation

---Inverts the condition expressed by the expectation
Expectation.never = Expectation

---Assert that the expectation value is the given type.
---@param typeName type
---@return Expectation
---
---```lua
---expect(5).to.be.a("number")
---```
function Expectation.a(typeName) end

Expectation.an = Expectation.a

---Assert that our expectation value is truthy
---@return Expectation
---
---```lua
---expect(intMap["fourteen"]).to.be.ok()
---```
function Expectation.ok() end

---Assert that our expectation value is equal to another value
---@param otherValue any
---@return Expectation
---
---```lua
---expect(container.value).to.equal(3)
---```
function Expectation.equal(otherValue) end

---Assert that our expectation value is equal to another value within some
---inclusive limit.
---@param otherValue number
---@param limit? number -- (default `0.0000001`)
---@return Expectation
---
---```lua
---expect(3.999).to.be.near(4, 0.01)
---```
function Expectation.near(otherValue, limit) end

---Assert that our functoid expectation value throws an error when called.
---An optional error message can be passed to assert that the error message
---contains the given value.
---@param messageSubstring string
---@return Expectation
---
---```lua
---
---```
function Expectation.throw(messageSubstring) end

---Create a new expectation
---@param value any
---@return Expectation
function expect(value) end