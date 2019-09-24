local function ThrowDice_D2K(ply, text)

if string.sub(text,1,2) == "!dice" or string.sub(text,1,2) == "/dice" then

	local playername = ply:GetName()

	local firstroll = math.random(1,6)
	local secondroll = math.random(1,6)
	local sum = firstroll + secondroll

--	local failfactor = math.random(1,24)

--	if failfactor != 20 then
	if failfactor != 123456789123456789 then

		//The Roll
		if sum == 1 || sum == 2 || sum == 3 || sum == 4 || sum == 5 || sum == 6 || sum == 7 || sum == 9 || sum == 10 || sum == 12 then
			roll = ( playername .. " rolled a " .. sum .. " (" .. firstroll .. " and " .. secondroll .. ")" )
		end

		if sum == 8 || sum == 11 then
			roll = ( playername .. " rolled an " .. sum .. " (" .. firstroll .. " and " .. secondroll .. ")" )
		end

		local locateplayers = player.GetAll( )
		for i = 1, table.getn( locateplayers ) do
			locateplayers[i]:ChatPrint( roll .. "\n" )
		end

		//Double Notification
		if firstroll == secondroll then

			local locateplayers = player.GetAll( )
			for i = 1, table.getn( locateplayers ) do
				locateplayers[i]:ChatPrint( "Rolled a double!\n" )
			end
		end

		//Random Bonus
--[[	if math.random(1,10) == 10 then

			local locateplayers = player.GetAll( )
			for i = 1, table.getn( locateplayers ) do
				locateplayers[i]:ChatPrint( "Received a random bonus of +" .. math.random(1,12) .. "\n" )
			end
--]]
	end
end

--[[	if failfactor == 24 then

		local failmessage = {}
		local decider = math.random(1,4)

		failmessage[1] = ( playername .. " ate his dice.")
		failmessage[2] = ( playername .. " threw the dice out of the window.")
		failmessage[3] = ( playername .. "'s dice buggered off somewhere else.")
		failmessage[4] = ( playername .. "'s dice were stolen by a cat.")

		local finalmessage = failmessage[decider]

		local locateplayers = player.GetAll( )
		for i = 1, table.getn( locateplayers ) do
			locateplayers[i]:ChatPrint( finalmessage .. "\n" )
		end
	end
--]]
return "" //Don't print in chat

end

end
hook.Add("PlayerSay", "RollTheDice_D2K", ThrowDice_D2K)