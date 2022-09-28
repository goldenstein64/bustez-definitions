---@meta
name = "TestEZ.expect"

words = {
	"expect%(%w*%)"
}

files = {
	".*%.spec%.lua"
}

configs = {
	{
		key = "Lua.workspace.library",
		action = "add",
		value = "$USERPROFILE/Documents/LuaEnvironments/expect"
	}
}