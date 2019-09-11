

local playername = ply:GetName()


hook.Add( "PlayerSay", "PlayerRoll" , function( ply, text, team )
	if (text == "/roll") or (text == "!roll") then 
			return "[Roll:] " .. playername .. " rolled " .. math.random( 1, 100 ) 
	end
end  )

hook.Add( "PlayerSay", "PlayerRollJacks" , function( ply, text, team )
	if (text == "/cards") or (text == "!cards") then 
	blackjacksrandom = math.random( 1, 10 )
			return "[Cards:] " .. playername .. " drew " .. blackjacksrandom
	end
end  )

hook.Add( "PlayerSay", "PlayerCoin" , function( ply, text, team )
	if (text == "/coin") or (text == "!coin") then 
			local coinresult = math.random( 0, 1 ) 
			if (coinresult == 0) then 
				return "[Coin:] " .. playername .. " flipped HEADS"
			else
				return "[Coin:] " .. playername .. " flipped TAILS"
			end
	end
end  )