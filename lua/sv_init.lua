

include("sh_func.lua")


HSRV = {}

local selected_round = {}

 util.AddNetworkString( net_name )

function HSRV:PickRound()

	-- 1/7
	local isFun = math.random(1,  13)

	--If regular round
	if (isFun != 3) return false end

	selected_round = table.Random(ROUNDS)

	selected_round:Init()

	self:InformRound(selected_round.ID)

	return true

end


function HSRV:InitHooks()
	hook.Add( "TTTBeginRound", hook_name, selected_round:Begin )
	hook.Add( "TTTCheckForWin", hook_name, selected_round:CheckForWin )
	hook.Add( "TTTEndRound" , hook_name , function() 
		selected_round:End()  
		self:EndHooks()
	end)
end

function HSRV:EndHooks()
	hook.Remove( "TTTBeginRound", hook_name)
	hook.Remove( "TTTEndRound" , hook_name)
	hook.Remove( "TTTCheckForWin", hook_name)
end


function HSRV:InformRound(roundID)
	 net.Start( net_name )		 // start writing the net message
	 net.WriteString( ronudID )
	 net.Broadcast()

end

hook.Add( "TTTPrepareRound", hook_name, function() 
		if (HSRV:PickRound())
			selected_round:Preap()
			HSRV:InitHooks()
		end

	end)