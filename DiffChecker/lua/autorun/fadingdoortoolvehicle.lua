hook.Add("CanTool", "Fading_Door_Deny", function(ply, tr, tool)
    if tool == "Your tool name" and tr.Entity:IsVehicle() and !(ply:IsAdmin() or ply:IsSuperAdmin()) then
        return false
    end
end)