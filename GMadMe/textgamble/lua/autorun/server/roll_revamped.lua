
-- This might need to be inside of a function...
local playername = ply:GetName()


hook.Add( "PlayerSay", "PlayerRoll" , function( ply, text, public )	-- This might need to be function( ply, text, public )
	text = string.lower( text )
	if (text == "/roll") or (text == "!roll") then 
		return "[Roll:] " .. playername .. " rolled " .. math.random( 1, 100 ) 
	end
end  )

hook.Add( "PlayerSay", "PlayerRollJacks21" , function( ply, text, public )
	text = string.lower( text )
	if (text == "/cards") or (text == "!cards") or (text == "/cards") or (text == "!cards") then 
		blackjacksrandom = math.random( 1, 10 )
			RunConsoleCommand("say", "you win")
			--game.ConsoleCommand( "say \"happyshopping\"\n" )	-- this actually prints to chat without error and written by 'console'
		return "[Cards:] " .. playername .. " drew " .. blackjacksrandom
	end
end  )

hook.Add( "PlayerSay", "PlayerCoin" , function( ply, text, public )
	text = string.lower( text )
	if (text == "/coin") or (text == "!coin") then 
		local coinresult = math.random( 0, 1 ) 
		if (coinresult == 0) then 
			return "[Coin:] " .. playername .. " flipped HEADS"
		else
			return "[Coin:] " .. playername .. " flipped TAILS"
		end
	end
end  )



--[[ ALTERNATE TEST CODE:


hook.Add( "PlayerSay", "TextGamble" , function( Player, text, public )
	text = string.lower( text )
	local playername = ply:GetName()
	if (text == "/roll") or (text == "!roll") then 
		return "[Roll:] " .. playername .. " rolled " .. math.random( 1, 100 ) 
			
	elseif (text == "/cards") or (text == "!cards") or (text == "/cards") or (text == "!cards") then 
		local blackjacksrandom = math.random( 1, 10 )
RunConsoleCommand("say", "testing")
		return "[Cards:] " .. playername .. " drew " .. blackjacksrandom
			
	elseif (text == "/coin") or (text == "!coin") then 
		local coinresult = math.random( 0, 1 ) 
		if (coinresult == 0) then 
			return "[Coin:] " .. playername .. " flipped HEADS"
		else
			return "[Coin:] " .. playername .. " flipped TAILS"
		end
	end
end  )






--]]