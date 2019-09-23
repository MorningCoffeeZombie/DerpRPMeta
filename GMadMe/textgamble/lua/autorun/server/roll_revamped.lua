
-- This might need to be inside of a function...
local playername = ply:GetName()


hook.Add( "PlayerSay", "PlayerRoll" , function( ply, text, public )	-- This might need to be function( ply, text, public )
	text = string.lower( text )
	if (text == "/roll") or (text == "!roll") then 
		return "[Roll:] " .. playername .. " rolled " .. math.random( 1, 100 ) 
	end
end  )

hook.Add( "PlayerSay", "PlayerRollJack21" , function( ply, text, public )
	text = string.lower( text )
	if (text == "/cards") or (text == "!cards") or (text == "/cards") or (text == "!cards") then 
		blackjackrandom = math.random( 1, 10 )
			RunConsoleCommand("say", "you win")
			--game.ConsoleCommand( "say "\"happyshopping\"\n" )	-- this actually prints to chat without error and written by 'console'
		return "[Cards:] " .. playername .. " drew " .. blackjackrandom
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


hook.Add( "PlayerSay", "TextGamble" , function( ply, text, public )
	text = string.lower( text )
	local gamble_playername = ply:GetName()

	if (text == "/roll") or (text == "!roll") then 
		return "[Roll:] " .. gamble_playername .. " rolled " .. math.random( 1, 100 ) 
	end

	if (text == "/cards") or (text == "!cards") or (text == "/cards") or (text == "!cards") then 
		local blackjackrandom = math.random( 1, 10 )
		RunConsoleCommand("say", "testing")
		return "[Cards:] " .. gamble_playername .. " drew " .. blackjackrandom
	end

	if (text == "/coin") or (text == "!coin") then 
		local coinresult = math.random( 0, 1 ) 
		if (coinresult == 0) then 
			return "[Coin:] " .. gamble_playername .. " flipped HEADS"
		else
			return "[Coin:] " .. gamble_playername .. " flipped TAILS"
		end
	end
end  )






--]]




arr_listofcards = { "Ace of Hearts",
					"King of Hearts",
					"Queen of Hearts",
					"Jack of Hearts",
					"Ten of Hearts",
					"Nine of Hearts",
					"Eight of Hearts",
					"Seven of Hearts",
					"Six of Hearts",
					"Five of Hearts",
					"Four of Hearts",
					"Three of Hearts",
					"Two of Hearts",
					"Ace of Clubs",
					"King of Clubs",
					"Queen of Clubs",
					"Jack of Clubs",
					"Ten of Clubs",
					"Nine of Clubs",
					"Eight of Clubs",
					"Seven of Clubs",
					"Six of Clubs",
					"Five of Clubs",
					"Four of Clubs",
					"Three of Clubs",
					"Two of Clubs",
					"Ace of Spades",
					"King of Spades",
					"Queen of Spades",
					"Jack of Spades",
					"Ten of Spades",
					"Nine of Spades",
					"Eight of Spades",
					"Seven of Spades",
					"Six of Spades",
					"Five of Spades",
					"Four of Spades",
					"Three of Spades",
					"Two of Spades",
					"Ace of Diamonds",
					"King of Diamonds",
					"Queen of Diamonds",
					"Jack of Diamonds",
					"Ten of Diamonds",
					"Nine of Diamonds",
					"Eight of Diamonds",
					"Seven of Diamonds",
					"Six of Diamonds",
					"Five of Diamonds",
					"Four of Diamonds",
					"Three of Diamonds",
					"Two of Diamonds"
}





















