local lean_npcs = {}
local function SaveNPCS(ply)
	for k, v in pairs(ents.FindByClass("lean_buyer")) do
		table.insert(lean_npcs,{pos = v:GetPos(),ang = v:GetAngles()})
		v:Remove()
	end
	for k, v in pairs(lean_npcs) do
		local npc = ents.Create("lean_buyer")
		npc:SetPos(v.pos)
		npc:SetAngles(v.ang)
		npc:Spawn()
	end
	local npcs = util.TableToJSON(lean_npcs)
	file.Write("lean_production/npcs.txt", npcs)
	table.Empty(lean_npcs)
	net.Start("lean_msg")
	net.WriteString("All NPC's on the map were saved! ( No need to restart :D )")
	net.Send(ply)
end
hook.Add("PlayerSay", "lean_verifysavingnpc", function(ply, txt)
	if !ply:IsPlayer() then return end
	if !ply:IsSuperAdmin() then return end
	if string.lower(txt) == "!savelean" then
		SaveNPCS(ply)
	elseif string.lower(txt) == "!leanbuyer" then
		local npc = ents.Create("lean_buyer")
		npc:SetPos(ply:GetPos())
		npc:SetAngles(ply:GetAngles())
		npc:Spawn()
		net.Start("lean_msg")
		net.WriteString("NPC spawned")
		net.Send(ply)
	end
end)