if SERVER then
	AddCSLuaFile() 
	include("sv_init.lua")
else
	include("cl_init.lua")
end


HROUNDS:init()