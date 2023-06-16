---@meta

---@class bustez.Expectation
local Expectation = {}

-- TestEZ modifiers

Expectation.to = Expectation
Expectation.be = Expectation
Expectation.been = Expectation
Expectation.have = Expectation
Expectation.was = Expectation
Expectation.at = Expectation

---inverts the condition expressed by the expectation
Expectation.never = Expectation

-- luassert modifiers

Expectation.is = Expectation
Expectation.are = Expectation
Expectation.has = Expectation
Expectation.does = Expectation

Expectation.no = Expectation.never
Expectation.to_not = Expectation.never
Expectation.not_to = Expectation.never
Expectation._not = Expectation.never

---add a message to this assertion
---@param message string
---@return bustez.Expectation self
---
---```lua
---expect(function()
---  expect(false).message("cool message").to.be.ok()
---end).to.match_error("cool message")
---```
function Expectation.message(message) end

---assert that our expectation value is the given type
---@param type type
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(5).to.be.a("number")
---```
function Expectation.a(type, message) end

Expectation.an = Expectation.a
Expectation.to_be_a = Expectation.a
Expectation.to_be_an = Expectation.a

---assert that our expectation value is a number
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(5).to.be.a.number()
---```
function Expectation.number(message) end

Expectation.to_be_a_number = Expectation.number
Expectation.a_number = Expectation.number

---assert that our expectation value is a boolean
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(true).to.be.a.boolean()
---```
function Expectation.boolean(message) end

Expectation.to_be_a_boolean = Expectation.boolean
Expectation.a_boolean = Expectation.boolean

---assert that our expectation is a string
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect("foo").to.be.a.string()
---```
function Expectation.string(message) end

Expectation.to_be_a_string = Expectation.string
Expectation.a_string = Expectation.string

---assert that our expectation is a thread
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(coroutine.create(function() end)).to.be.a.thread()
---```
function Expectation.thread(message) end

Expectation.a_thread = Expectation.thread
Expectation.to_be_a_thread = Expectation.thread

---assert that our expectation is a table
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect({}).to.be.a.table()
---```
function Expectation.table(message) end

Expectation.to_be_a_table = Expectation.table
Expectation.a_table = Expectation.table

---assert that our expectation is a userdata
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(io.open("...")).to.be.a.userdata()
---```
function Expectation.userdata(message) end

Expectation.to_be_a_userdata = Expectation.userdata
Expectation.a_userdata = Expectation.userdata

---assert that our expectation is a function
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(function() end).to.be.a._function()
---```
function Expectation._function(message) end

Expectation.to_be_a_function = Expectation._function
Expectation.a_function = Expectation._function

---assert that our expectation is precisely `nil`
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(nil).to.be._nil()
---```
function Expectation._nil(message) end

Expectation.to_be_nil = Expectation._nil
Expectation.be_nil = Expectation._nil

---assert that our expectation is precisely `true`
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(true).to.be._true()
---```
function Expectation._true(message) end

Expectation.to_be_true = Expectation._true
Expectation.be_true = Expectation._true

---assert that our expectation is precisely `false`
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(false).to.be._false()
---```
function Expectation._false(message) end

Expectation.to_be_false = Expectation._false
Expectation.be_false = Expectation._false

---assert that our expectation value is truthy
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(false).to.never.be.ok()
---```
function Expectation.ok(message) end

Expectation.truthy = Expectation.ok
Expectation.to_be_ok = Expectation.ok
Expectation.to_be_truthy = Expectation.ok

---assert that our expectation is falsy, i.e. `false` or `nil`
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(false).to.be.falsy()
---expect(nil).to.be.falsy()
---```
function Expectation.falsy(message) end

Expectation.to_be_falsy = Expectation.falsy

---assert that our expectation value is equal to another value
---@param otherValue any
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(1e3).to.equal(1000)
---```
function Expectation.equal(otherValue, message) end

Expectation.equals = Expectation.equal
Expectation.to_equal = Expectation.equal

---assert that our expectation value is equal to another value within some
---inclusive limit
---@param otherValue number
---@param limit? number -- defaults to `0.0000001`
---@param message? string
---@return bustez.Expectation self
---
---```lua
---expect(3.999).to.be.near(4, 0.01)
---```
function Expectation.near(otherValue, limit, message) end

Expectation.to_be_near = Expectation.near

---assert that our functoid expectation value throws an error when called
---
---An optional error message can be passed to assert that the error message
---is the given value.
---@param message? string
---@return bustez.Expectation self
---
---```lua
---local function fail()
---  error("oh no")
---end
---
---expect(fail).to.throw("oh no")
---expect(fail).to.never.throw("o")
---```
function Expectation.throw(message) end

Expectation.error = Expectation.throw
Expectation.errors = Expectation.throw
Expectation.to_throw = Expectation.throw
Expectation.to_error = Expectation.throw

---assert that our functoid expectation value throws an error that matches the
---given pattern
---@param pattern string
---@param init? number -- where to start searching
---@param plain? boolean -- should the pattern be treated as plain text?
---@param message? string
---@return bustez.Expectation
---
---```lua
---local function fail()
---  error("{failure}: oh no")
---end
---
---expect(fail).to.match.error("oh no")
---expect(fail).to.match.error("{failure}")
---expect(fail).to.match.error("%a+")
---```
---@overload fun(pattern: string, init?: number, message?: string, plain?: boolean): (self: bustez.Expectation)
---@overload fun(pattern: string, message?: string, init?: number, plain?: boolean): (self: bustez.Expectation)
function Expectation.match_error(pattern, init, plain, message) end

Expectation.matches_error = Expectation.match_error
Expectation.error_match = Expectation.match_error
Expectation.error_matches = Expectation.match_error
Expectation.to_match_error = Expectation.match_error
Expectation.matches = { error = Expectation.match_error }
Expectation.match = { error = Expectation.match_error }
Expectation.error = {
  match = Expectation.match_error,
  matches = Expectation.match_error,
}

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

Expectation.look_like = Expectation.like
Expectation.looks_like = Expectation.like
Expectation.to_be_like = Expectation.like
Expectation.to_look_like = Expectation.like
Expectation.look = { like = Expectation.like }

Expectation.same = Expectation.like

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

Expectation.matches = Expectation.match
Expectation.to_match = Expectation.match

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

Expectation.to_be_unique = Expectation.unique

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

Expectation.to_have_holes = Expectation.holes

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

---changes the order of arguments for an assertion when passed through `expect`
---@param assertion_name string
---@param map integer[] -- an array of argument positions
---
---```lua
---say:set("assertion.matchx.positive", "Expected string to match.\nPattern:\n%s\nPassed in:\n%s")
---say:set("assertion.matchx.positive", "Did not expect string to match.\nPattern:\n%s\nPassed in:\n%s")
---
---local function matchx(state, arguments, level)
---  return string.find(unpack(arguments)) ~= nil
---end
---
---expect.extend({ matchx = matchx })
---expect.map_args("matchx", { 2, 1 })
---
---assert.does_matchx("^%s+$", "\t\n   \n\t")
---expect("\t\n   \n\t").to.matchx("^%s+$")
---```
function expect.map_args(assertion_name, map) end

return expect
