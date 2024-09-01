--- Dev library (SuperAdmin only)
-- @name dev
-- @class library
-- @libtbl dev_library
SF.RegisterLibrary("dev")

return function(instance)
if instance.player ~= SF.Superuser and (not IsValid(instance.player) or not instance.player:IsPlayer() or not instance.player:IsSuperAdmin()) then return end

local dev_library = instance.Libraries.dev

--- Returns the global Lua table
-- @shared
-- @return table Global table
function dev_library.getGlobal()
	return _G
end

--- Returns the starfall instance
-- @shared
-- @return table Starfall instance
function dev_library.getInstance()
	return instance
end

--- Makes the rest of the chip run outside of the starfall environment
-- @shared
-- @return table Original starfall environment
function dev_library.setGlobal()
	local oldEnv = instance.env

	instance.env = _G
	for _, script in pairs(instance.scripts) do
		debug.setfenv(script, _G)
	end

	return oldEnv
end

end
