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


hook.Add( "PlayerSay", "TextGamble" , function( ply, text, public )
	-- GLOBAL VARS
	text = string.lower( text )
	local gamble_playername = ply:GetName()
	local locateplayers = player.GetAll( )

	-- ROLL
	if (text == "/roll") or (text == "!roll") then 
		local rollresult = math.random( 1, 100 )
		for i = 1, table.getn( locateplayers ) do
			locateplayers[i]:ChatPrint( "[ROLL:] " .. gamble_playername .. " rolled " .. rollresult .. "\n" )
		end
		return ""
	end

	-- DICE
	if (text == "/dice") or (text == "!dice") then 
		local firstdice = math.random(1,6)
		local seconddice = math.random(1,6)
		local sum = firstdice + seconddice
		for i = 1, table.getn( locateplayers ) do
			locateplayers[i]:ChatPrint( "[DICE:] " .. gamble_playername .. " threw " .. firstdice .. " and " .. seconddice .. "\n" )
		end
		return ""
	end
		
	-- CARDS
	if (text == "/cards") or (text == "!cards") or (text == "/cards") or (text == "!cards") then 
		local cardsresult = table.Random( arr_listofcards )
		for i = 1, table.getn( locateplayers ) do
			locateplayers[i]:ChatPrint( "[CARDS:] " .. gamble_playername .. " drew " .. cardsresult .. "\n" )
		end
		return ""
	end

	-- COIN
	if (text == "/coin") or (text == "!coin") then 
		local coinresult = math.random( 0, 1 ) 
		if (coinresult == 0) then 
			for i = 1, table.getn( locateplayers ) do
				locateplayers[i]:ChatPrint( "[COIN:] " .. gamble_playername .. " flipped HEADS " .. "\n" )
			end
			return ""
		else
			for i = 1, table.getn( locateplayers ) do
				locateplayers[i]:ChatPrint( "[COIN:] " .. gamble_playername .. " flipped TAILS " .. "\n" )
			end
			return ""
		end
	end
end  )
































