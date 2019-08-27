if (not SERVER) then return end
zmlab = zmlab or {}
zmlab.f = zmlab.f or {}

function zmlab.f.TransportCrate_Initialize(TransportCrate)
    zmlab.f.Debug("zmlab.f.TransportCrate_Initialize")
    zmlab.f.EntList_Add(TransportCrate)

    if zmlab.config.TransportCrate.FullCollide then
        TransportCrate:SetCollisionGroup(COLLISION_GROUP_NONE)
    else
        TransportCrate:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    end

    TransportCrate.IsClosed = false
    TransportCrate.PhysgunDisable = true
end

function zmlab.f.TransportCrate_USE(TransportCrate,ply)
    zmlab.f.Debug("zmlab.f.TransportCrate_Initialize")

    if (not zmlab.f.Player_CheckJob(ply)) then
        zmlab.f.Notify(ply, zmlab.language.General_Interactjob, 1)

        return
    end

    if zmlab.config.TransportCrate.NoWait then
        if TransportCrate:GetMethAmount() <= 0 then return end
    else
        if TransportCrate:GetMethAmount() < zmlab.config.TransportCrate.Capacity then return end
    end

    if zmlab.config.MethBuyer.SellMode == 1 or zmlab.config.MethBuyer.SellMode == 3 then

        zmlab.f.CreateSoundEffect("progress_fillingcrate",TransportCrate)

        ply.zmlab_meth = ply.zmlab_meth or 0
        ply.zmlab_meth = ply.zmlab_meth + TransportCrate:GetMethAmount()

        local str = string.Replace(zmlab.language.transportcrate_collect, "$methAmount", tostring(math.Round(TransportCrate:GetMethAmount())))
        zmlab.f.Notify(ply, str, 0)

        TransportCrate:Remove()
    else

        if TransportCrate:GetMethAmount() >= zmlab.config.TransportCrate.Capacity and TransportCrate.IsClosed == false then
            TransportCrate.IsClosed = true
            zmlab.f.CreateAnimTable(TransportCrate, "close", 1)
        end
    end
end


function zmlab.f.TransportCrate_StartTouch(TransportCrate,other)
    if not IsValid(TransportCrate) then return end
    if not IsValid(other) then return end
    if other:GetClass() != "zmlab_meth" and other:GetClass() != "zmlab_meth_baggy" then return end
    if other:GetClass() == "zmlab_meth_baggy" and other.Enabled == false then return end
    if zmlab.f.CollisionCooldown(other) then return end
    if  TransportCrate:GetMethAmount() >= zmlab.config.TransportCrate.Capacity then return end

    zmlab.f.TransportCrate_AddMeth(TransportCrate,other)
end

function zmlab.f.TransportCrate_AddMeth(TransportCrate, meth)
    TransportCrate:SetMethAmount(TransportCrate:GetMethAmount() + meth:GetMethAmount())

    zmlab.f.CreateEffect("zmlab_meth_filling", TransportCrate, TransportCrate:GetAngles(),  TransportCrate:GetPos(), 0)
    zmlab.f.CreateSoundEffect("progress_fillingcrate", TransportCrate)

    SafeRemoveEntity(meth)
    zmlab.f.TransportCrate_UpdateVisuals(TransportCrate)
end


function zmlab.f.TransportCrate_UpdateVisuals(TransportCrate)
    local methAmount = TransportCrate:GetMethAmount()

    if methAmount >= zmlab.config.TransportCrate.Capacity then
        TransportCrate.IsClosed = true
        zmlab.f.CreateAnimTable(TransportCrate, "close", 1)
        TransportCrate:SetBodygroup(0, 3)
    elseif methAmount > zmlab.config.TransportCrate.Capacity * 0.7 then
        TransportCrate:SetBodygroup(0, 3)
    elseif methAmount > zmlab.config.TransportCrate.Capacity * 0.5 then
        TransportCrate:SetBodygroup(0, 2)
    else
        TransportCrate:SetBodygroup(0, 1)
    end
end

function zmlab.f.TransportCrate_Delayed_UpdateVisuals(TransportCrate)
    timer.Simple(0.1, function()
        if IsValid(TransportCrate) then
            TransportCrate.IsClosed = true
            zmlab.f.CreateAnimTable(TransportCrate, "close", 10)
            TransportCrate:SetBodygroup(0, 3)
        end
    end)
end
