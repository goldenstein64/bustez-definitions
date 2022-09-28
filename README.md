# expect_env

A type lib written for [Sumneko's Lua LSP](https://github.com/sumneko/lua-language-server) and [TestEZ's](https://github.com/Roblox/testez) `expect()` assertion library, meant to be used with [busted](https://github.com/lunarmodules/busted) to achieve a TestEZ-ish environment.

You can use this in your own project by placing `Expectation.lua` and `addExpect.lua` next to your `.busted` config and including the latter script as a helper.