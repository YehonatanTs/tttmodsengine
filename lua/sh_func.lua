local hook_name = "Hell's Fun Rounds"
local net_name = "HellsFunRounds"

local HROUNDS = {}

--Collection of the loaded rounds
local ROUNDS = {}
--Single round
--[[
	Structure as follows:

	ROUND.Name
	Round.Description
	Callbacks  - 
	Init - ROUND.Init
	Preapering - ROUND.Preap
	Round start - ROUND.Begin
	Check for win - ROUND.CheckForWin
	End of round - ROUND.End

	You can have your own functions but you'll need to call them.

]]






function HROUNDS:init()

	local rounds, _ = file.Find('rounds/*.lua', 'LUA')

	for _,round in pairs(rounds) do
		local ROUND = {}
		ROUND.ID = string.gsub(string.lower(round), '.lua', '')
		ROUND.Name = false
		Round.Description = false
		Round.Init = function () return false end
		Round.Preap = function () return false end
		Round.CheckForWin = false
		Round.End = function () return false end


		include('hell-rounds/' .. round)

		ROUNDS[ROUND.ID] = ROUND

		ROUND = nil
	end

end
