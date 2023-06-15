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
---@param message? string
---@return bustez.Expectation self
---
---```lua
---local value = { 1, 2, 3 }
---expect(value).to.be.like({ 1, 2, 3 })
---expect(value).to.look.like({ 1, 2, 3 })
---```
function Expectation.like(otherValue, message) end

---assert that our string expectation value matches the given pattern
---@param pattern string
---@param init? number -- where to start searching
---@param plain? boolean -- should the pattern be treated as plain text?
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect("test string").to.match("^test")
---expect("test string").to.match("string$")
---expect("test string").to.never.match("foo")
---expect("test string").to.match("%w")
---```
---@overload fun(pattern: string, init?: number, message?: string, plain?: boolean): (self: bustez.Expectation)
---@overload fun(pattern: string, message?: string, init?: number, plain?: boolean): (self: bustez.Expectation)
function Expectation.match(pattern, init, plain, message) end

---assert that our table expectation value has no duplicate elements
---@param deep? boolean -- uses deep comparison on `true`, `==` otherwise
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect({ 1, 2, 3 }).to.be.unique()
---expect({ a = 1, b = 2, c = 3 }).to.be.unique()
---expect({ { "a" }, { "a" } }).to.never.be.unique(true)
---expect({ { "a" }, { "a" } }).to.be.unique(false)
---```
---@overload fun(message?: string, deep?: boolean): (self: bustez.Expectation)
function Expectation.unique(deep, message) end

---assigns an array to the expectation.
---
---@see bustez.Expectation.holes
---@param arr any[]
---@return bustez.Expectation self
function Expectation.array(arr) end

---assert that our array expectation value contains a `nil` element.
---
---The optional `length` argument forces `expect()` to interpret the array as 
---having the given length.
---@param length? number
---@return bustez.Expectation self
---
---```lua
---expect.array({ 1, 2, 3 }).to.have.no.holes()
---expect.array({ 1, 2, 3 }).to.have.holes(4)
---expect.array({ 1, 2, nil, 4 }).to.have.holes()
---```
function Expectation.holes(length) end

---assigns a spy to the expectation
---@param aspy luassert.spy | luassert.stub
---@param message? string
---@return bustez.Expectation self
function Expectation.spy(aspy, message) end

---assigns a stub to the expectation
---@param astub luassert.spy | luassert.stub
---@param message? string
---@return bustez.Expectation self
function Expectation.stub(astub, message) end

---asserts that our expectation value, a spy or stub, returned the given values
---@param ... any
---@return bustez.Expectation self
---
---```lua
---local funSpy = spy.new(function() return 1, 2, 3 end)
---funSpy()
---
---expect.spy(funSpy).to.have.returned.with(1, 2, 3)
---```
function Expectation.returned_with(...) end

Expectation.to_have_returned_with = Expectation.returned_with
Expectation.returned = { with = Expectation.returned_with }

---asserts that our expectation value, a spy or stub, was called with the given
---arguments
---@param ... any
---@return bustez.Expectation self
---
---```lua
---local funSpy = spy.new(function() end)
---funSpy(2, 3, 5)
---
---expect.spy(funSpy).to.be.called.with(2, 3, 5)
---```
function Expectation.called_with(...) end

Expectation.to_be_called_with = Expectation.called_with

---asserts that our expectation value, a spy or stub, was called the given
---number of times
---@param times number
---@return bustez.Expectation self
---
---```lua
---local funSpy = spy.new(function() end)
---funSpy()
---funSpy()
---funSpy()
---
---expect.spy(funSpy).to.be.called(3)
---```
function Expectation.called(times) end

---asserts that our expectation value, a spy or stub, was called at least the
---given number of times
---@param times number
---@return bustez.Expectation self
---
---```lua
---local funSpy = spy.new(function() end)
---funSpy()
---funSpy()
---funSpy()
---
---expect.spy(funSpy).to.be.called.at.least(1)
---```
function Expectation.called_at_least(times) end

Expectation.to_be_called_at_least = Expectation.called_at_least

---asserts that our expectation value, a spy or stub, was called at most the
---given number of times
---@param times number
---@return bustez.Expectation self
---
---```lua
---local funSpy = spy.new(function() end)
---funSpy()
---funSpy()
---funSpy()
---
---expect.spy(funSpy).to.be.called.at.most(5)
---```
function Expectation.called_at_most(times) end

Expectation.to_be_called_at_most = Expectation.called_at_most

Expectation.called = {
  with = Expectation.called_with,
  at = {
    least = Expectation.called_at_least,
    most = Expectation.called_at_most,
  },
  at_most = Expectation.called_at_most,
  at_least = Expectation.called_at_least,
}
Expectation.to_be_called = Expectation.called

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
