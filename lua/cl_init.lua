	include("sh_func.lua")

	print ("Hell's Custom Fun Rounds loaded")

	net.Receive( net_name, function( len )
		local round =  ROUNDS[net.ReadString()]

		PrintTable( round )
		
	end) 