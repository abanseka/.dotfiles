local function reload(name)
	package.loaded[name] = nil
	require(name)
end

reload("user.options")
reload("user.plugins")
reload("user.theme")
reload("user.keymaps")
reload("user.overrides")
