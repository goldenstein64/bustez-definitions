# BustEZ Definitions

A type lib written for [sumneko/lua-language-server](https://github.com/sumneko/lua-language-server) in conjunction with [goldenstein64/bustez](https://github.com/goldenstein64/bustez).

## Usage

```jsonc
// .vscode/settings.json
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
