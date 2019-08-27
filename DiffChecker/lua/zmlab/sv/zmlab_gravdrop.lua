if not SERVER then return end
zmlab = zmlab or {}
zmlab.f = zmlab.f or {}

local zmlab_dropents = {
	["zmlab_meth"] = true,
	["zmlab_collectcrate"] = true,
	["zmlab_palette"] = true,
}

function zmlab.f.GravGun_DropOffPoint(ply, ent)
	if not IsValid(ply) then return end
	if not IsValid(ent) then return end
	if zmlab_dropents[ent:GetClass()] and ent:GetMethAmount() > 0 then
		for k, v in pairs(zmlab.DropOffPoints) do
			if IsValid(v) and zmlab.f.InDistance(v:GetPos(), ent:GetPos(), 45) and IsValid(v.Deliver_Player) then

				zmlab.f.SellMeth_DropOffPoint(ply, v,ent)
				break
			end
		end
	end
end

function zmlab.f.GravGun_MainLogic(ply, ent)
	zmlab.f.GravGun_DropOffPoint(ply, ent)
end

hook.Add("GravGunOnDropped", "zmlab_GravGunOnDropped", zmlab.f.GravGun_MainLogic)
