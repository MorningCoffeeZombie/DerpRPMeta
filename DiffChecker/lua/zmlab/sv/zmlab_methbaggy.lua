if (not SERVER) then return end
zmlab = zmlab or {}
zmlab.f = zmlab.f or {}

function zmlab.f.Methbaggy_Initialize(Methbaggy)
    zmlab.f.Debug("zmlab.f.Methbaggy_Initialize")
    zmlab.f.EntList_Add(Methbaggy)
    Methbaggy.Enabled = false

    timer.Simple(2, function()
        if IsValid(Methbaggy) then
            Methbaggy.Enabled = true
        end
    end)
end

function zmlab.f.Methbaggy_USE(Methbaggy, ply)
    zmlab.f.Debug("zmlab.f.Methbaggy_USE")
    if not IsValid(Methbaggy) then return end
    if not zmlab.config.Meth.Consumable then return end
    --Increase Meth Screeneffect
    zmlab.f.CreateScreenEffectTable(ply)
    --Play random tuco sounds
    ply:StopSound("sfx_meth_consum")

    ply:EmitSound("sfx_meth_consum")
    local newHealth = ply:Health() - zmlab.config.Meth.Damage

    if (newHealth <= 0) then
        ply:Kill()
    else
        ply:SetHealth(newHealth)
    end

    -- Here we set the on meth logic
    if (ply.zmlab_OnMeth == false or ply.zmlab_OnMeth == nil) then
        ply.zmlab_old_WalkSpeed = ply:GetWalkSpeed()
        ply.zmlab_old_RunSpeed = ply:GetRunSpeed()
        ply:SetRunSpeed(ply:GetRunSpeed() + 200)
        ply:SetWalkSpeed(ply:GetWalkSpeed() + 200 / 2)
    end

    local playertimer = "zmlab_PlayerOnMethTimer" .. ply:SteamID64()

    if (timer.Exists(playertimer)) then
        timer.Remove(playertimer)
    end

    timer.Create(playertimer, zmlab.config.Meth.EffectDuration, 1, function()
        if (IsValid(ply)) then
            ply.zmlab_OnMeth = false
            ply:SetRunSpeed(ply.zmlab_old_RunSpeed or 500)
            ply:SetWalkSpeed(ply.zmlab_old_WalkSpeed or 200)
        end
    end)

    ply.zmlab_OnMeth = true
    Methbaggy:Remove()
end
