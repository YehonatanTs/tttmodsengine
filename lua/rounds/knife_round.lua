
local kniferound = "kniferound"
ROUND.Name = "Knife Round"
ROUND.Description = "Only knives. Fight to death."
ROUND.Points =  {
win = 300,
most_kills = 200,
kill = 15
}

function ROUND:makeUnPickAble()
	hook.Add( "PlayerCanPickupWeapon", kniferound, function() return false end )
end

function ROUND:Begin()
	local players = player.GetAll()

	for k, v in pairs( players ) do
		if v:IsValid() and v:IsPlayer() and v:Alive() then
			v:PrintMessage( HUD_PRINTTALK, " **** Knife round strated **** " )
			v:RemoveAllItems()
			v:Give( "weapon_ttt_knife" )
			v:SetActiveWeapon ( "weapon_ttt_knife" )
		end
	end
	self.makeUnPickAble() 
end

function  ROUND:CheckForWin()
	local count = 0
	for k, v in pairs( player.GetAll() ) do
		if ( v:Alive() ) then
			count = count + 1
		end
	end
	if(count <= 1) then
		return WIN_TIMELIMIT
	else
		return WIN_NONE
	end	
end

function ROUND:End()
	hook.Remove( "PlayerCanPickupWeapon", kniferound)
	hook.Remove( "PlayerDeath", kniferound )
end

hook.Add("PlayerDeath", kniferound, function(victim, inflictor, v)
		if v:IsValid() and v:IsPlayer() and v:Alive() then
			v:RemoveAllItems()
			v:Give( "weapon_ttt_knife" )
			v:SetActiveWeapon ( "weapon_ttt_knife" )
		end
	end)