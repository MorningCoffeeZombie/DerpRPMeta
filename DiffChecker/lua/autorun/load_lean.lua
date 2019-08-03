/* 76561198065274788 */
/* Thanks for purchasing and supporting me, Derp! */
local dir = "lean_production/"
if SERVER then
	local files = file.Find(dir .. "*", "LUA")
	for k, v in pairs(files) do
		if string.StartWith(v, "sv_") then
			include(dir .. v)
		elseif string.StartWith(v, "sh_") then
			AddCSLuaFile(dir .. v)
			include(dir .. v)
		elseif string.StartWith(v, "cl_") then
			AddCSLuaFile(dir .. v)
		end
	end
	util.AddNetworkString("LeanigConfig")
	util.AddNetworkString("lean_updatecfg")
	util.AddNetworkString("lean_initialupdate")
	util.AddNetworkString("lean_buyingredient")
	util.AddNetworkString("lean_sendeffects")
	util.AddNetworkString("lean_msg")
	AddCSLuaFile("lean_config.lua")
	include("lean_config.lua")
	if not file.Exists("lean_production","DATA") then
		file.CreateDir("lean_production")
	end
	if not file.Exists("lean_production/config.txt","DATA") then
		file.Write("lean_production/config.txt",util.TableToJSON(lean_igconfig))
	else -- Make sure any new config options i added get synced in with the old ones
		local old = util.JSONToTable(file.Read("lean_production/config.txt","DATA"))
		local new = lean_igconfig
		for k, v in pairs(new) do
			for u, i in pairs(old) do
				if k == u then
					new[k] = nil
					break
				end
			end
		end
		if table.Count(new) > 0 then
			table.Merge(old,new)
		end
		file.Write("lean_production/config.txt",util.TableToJSON(old))
	end
	lean_updated = util.JSONToTable(file.Read("lean_production/config.txt","DATA"))
	if file.Exists("lean_production/npcs.txt","DATA") then
		local npcs = util.JSONToTable(file.Read("lean_production/npcs.txt","DATA"))
		timer.Simple(1,function() -- Spawning entities at this point doesn't want to work
			for k, v in pairs(npcs) do
				local npc = ents.Create("lean_buyer")
				npc:SetPos(v.pos)
				npc:SetAngles(v.ang)
				npc:Spawn()
			end
		end)
	end
	print("[Lean Procuction] Serverside loaded successfully")
elseif CLIENT then
	local files = file.Find(dir .. "*", "LUA")
	for k, v in pairs(files) do
		if string.StartWith(v, "sh_") || string.StartWith(v, "cl_") then
			include(dir .. v)
		end
	end
	include("lean_config.lua")
	print("[Lean Procuction] Clientside loaded successfully")
end
print("[Lean Procuction] Fully Loaded")