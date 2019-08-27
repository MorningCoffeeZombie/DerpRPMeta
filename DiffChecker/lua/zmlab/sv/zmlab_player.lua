if (not SERVER) then return end
zmlab = zmlab or {}
zmlab.f = zmlab.f or {}

if zmlab_PlayerList == nil then
    zmlab_PlayerList = {}
end

function zmlab.f.Add_Player(ply)
    table.insert(zmlab_PlayerList, ply)
end

hook.Add("PlayerInitialSpawn", "zmlab_PlayerInitialSpawn", function(ply)
    timer.Simple(1, function()
        if IsValid(ply) then
            zmlab.f.Add_Player(ply)
        end
    end)
end)



util.AddNetworkString("zmlab_stop_screeneffects")

hook.Add("PlayerDeath", "zmlab_PlayerDeath", function(victim, inflictor, attacker)
    net.Start("zmlab_stop_screeneffects")
    net.Send(victim)

    if zmlab.config.Meth.DropMeth_OnDeath then
        zmlab.f.PlayerDeath(victim, inflictor, attacker)
    end
end)

local function spawnMethBox(pos)
    local ent = ents.Create("zmlab_collectcrate")
    ent:SetAngles(Angle(0, 0, 0))
    ent:SetPos(pos)
    ent:Spawn()
    ent:Activate()

    return ent
end

function zmlab.f.PlayerDeath(victim, inflictor, attacker)
    if (IsValid(victim) and victim.zmlab_meth ~= nil and victim.zmlab_meth > 0) then
        local meth = spawnMethBox(victim:GetPos() + Vector(0, 0, 10))
        meth:SetMethAmount(victim.zmlab_meth)

        timer.Simple(0.25, function()
            if IsValid(meth) then
                zmlab.f.TransportCrate_UpdateVisuals(meth)
            end
        end)

        victim.zmlab_meth = 0
        victim.zmlab_OnMeth = false

        if (victim.zmlab_old_RunSpeed) then
            victim:SetRunSpeed(victim.zmlab_old_RunSpeed or 500)
        end

        if (victim.zmlab_old_WalkSpeed) then
            victim:SetWalkSpeed(victim.zmlab_old_WalkSpeed or 200)
        end
    end
end

hook.Add("EntityTakeDamage", "zmlab_PlayerOnMeth_EntityTakeDamage", function(target, dmginf)
    if IsValid(target) and target:IsPlayer() and target:Alive() and target.zmlab_OnMeth then
        dmginf:ScaleDamage(0.5)
    end
end)


local zmlab_DeleteEnts = {
    ["zmlab_aluminium"] = true,
    ["zmlab_collectcrate"] = true,
    ["zmlab_combiner"] = true,
    ["zmlab_filter"] = true,
    ["zmlab_frezzer"] = true,
    ["zmlab_frezzingtray"] = true,
    ["zmlab_methylamin"] = true,
    ["zmlab_palette"] = true
}
function zmlab.f.PlayerCleanUp(ply)

    if IsValid(ply.DropOffPoint) then
        zmlab.f.Dropoffpoint_Close(ply.DropOffPoint)
    end

    for k, v in pairs(zmlab.EntList) do
        if IsValid(v) and zmlab_DeleteEnts[v:GetClass()] and zmlab.f.GetOwnerID(v) == ply:SteamID() then
            v:Remove()
        end
    end
end


hook.Add("OnPlayerChangedTeam", "zmlab_OnPlayerChangedTeam", function(ply, before, after)
     zmlab.f.PlayerCleanUp(ply)
end)

hook.Add("PostPlayerDeath", "zmlab_PostPlayerDeath", function(ply, text)
    if IsValid(ply.DropOffPoint) then
        zmlab.f.Dropoffpoint_Close(ply.DropOffPoint)
    end
end)

hook.Add("PlayerSilentDeath", "zmlab_PlayerSilentDeath", function(ply, text)
    if IsValid(ply.DropOffPoint) then
        zmlab.f.Dropoffpoint_Close(ply.DropOffPoint)
    end
end)
