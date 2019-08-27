zmlab = zmlab or {}
zmlab.f = zmlab.f or {}


-- List of all the zmlab Entities on the server
if zmlab.EntList == nil then
	zmlab.EntList = {}
end

function zmlab.f.EntList_Add(ent)
	table.insert(zmlab.EntList, ent)
end

if SERVER then


	concommand.Add("zmlab_debug_EntList", function(ply, cmd, args)
		if IsValid(ply) and zmlab.f.IsAdmin(ply) then
			PrintTable(zmlab.EntList)
		end
	end)
end
