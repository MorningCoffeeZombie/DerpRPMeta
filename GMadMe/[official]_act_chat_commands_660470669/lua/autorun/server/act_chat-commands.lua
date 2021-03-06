/*
The MIT License (MIT)

Copyright (c) 2016 Desutin sumisu

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/


	
hook.Add("PlayerSay", "act_chat_commands", function(Player, text, public)
	text = string.lower( text )
	if ( text == "!kill" ) or ( text == "/kill" ) then
		Player:ConCommand("kill")
		return ""
	elseif ( text == "/cheer" ) or ( text == "!cheer" ) then
		Player:ConCommand("act cheer")
		--RunConsoleCommand("say", "Hello, I didn't type this.")
		return ""
	elseif ( text == "!laugh" ) or ( text == "/laugh" ) then
		Player:ConCommand("act laugh")
		return ""
	elseif ( text == "!muscle" ) or ( text == "/muscle" ) then
		Player:ConCommand("act muscle")
		return ""
	elseif ( text == "!zombie" ) or ( text == "/zombie" ) then
		Player:ConCommand("act zombie")
		return ""
	elseif ( text == "!robot" ) or ( text == "/robot" ) then
		Player:ConCommand("act robot")
		return ""
	elseif ( text == "!dance" ) or ( text == "/dance" ) then
		Player:ConCommand("act dance")
		return ""
	elseif ( text == "!agree" ) or ( text == "/agree" ) then
		Player:ConCommand("act agree")
		return ""
	elseif ( text == "!becon" ) or ( text == "/becon" ) then
		Player:ConCommand("act becon")
		return ""
	elseif ( text == "!disagree" ) or ( text == "/disagree" ) then
		Player:ConCommand("act disagree")
		return ""
	elseif ( text == "!salute" ) or ( text == "/salute" ) then
		Player:ConCommand("act salute")
		return ""
	elseif ( text == "!wave" ) or ( text == "/wave" )  then
		Player:ConCommand("act wave")
		return ""
	elseif ( text == "!forward" ) or ( text == "/forward" ) then
		Player:ConCommand("act forward")
		return ""
	elseif ( text == "!pers" ) or ( text == "/pers" ) then
		Player:ConCommand("act pers")
		return ""
	end
end)