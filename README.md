# expect_env

A type lib written for [Sumneko's Lua LSP](https://github.com/sumneko/lua-language-server) and [TestEZ's](https://github.com/Roblox/testez) `expect()` assertion library, meant to be used with [busted](https://github.com/lunarmodules/busted) to achieve a TestEZ-ish environment.

## Usage

```jsonc
{
	"Lua.workspace.library": [
		// path to wherever this repo was cloned to
		"path/to/this/repo"
		// e.g. on Windows, "$USERPROFILE/Documents/LuaEnvironments/bustez"
	]
}
```

For a more detailed description of how to install a library of definition files, see the LSP's [wiki](https://github.com/sumneko/lua-language-server/wiki/Libraries).

## Types

The types provided by this library are, exhaustively:

* Every class is listed below:
	* `bustez`
  * `bustez.Expectation`
* Every alias is listed below:
	* `bustez.expect`