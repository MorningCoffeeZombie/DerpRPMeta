AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (not tr.Hit) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 1
	local ent = ents.Create("zmlab_frezzer")
	local angle = ply:GetAimVector():Angle()
	angle = Angle(0, angle.yaw, 0)
	angle:RotateAroundAxis(angle:Up(), -90)
	ent:SetAngles(angle)
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	zmlab.f.SetOwner(ent, ply)

	return ent
end

function ENT:Initialize()
	self:SetModel("models/zerochain/zmlab/zmlab_frezzer.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:SetTrigger(true)
	local phys = self:GetPhysicsObject()

	if (phys:IsValid()) then
		phys:Wake()
		phys:EnableMotion(true)
	end

	zmlab.f.Frezzer_Initialize(self)
end

function ENT:StartTouch(other)
	zmlab.f.Frezzer_StartTouch(self, other)
end

function ENT:AcceptInput(input, activator, caller, data)
	if string.lower(input) == "use" and IsValid(activator) and activator:IsPlayer() and activator:Alive() then
		zmlab.f.Frezzer_USE(self, activator)
	end
end

function ENT:OnRemove()
	zmlab.f.Frezzer_OnRemove(Frezzer)
end

function ENT:OnTakeDamage(dmg)
	zmlab.f.Entity_OnTakeDamage(self, dmg,"Explosion")
end
