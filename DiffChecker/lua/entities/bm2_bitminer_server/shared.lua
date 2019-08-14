ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Bitminer Server"
ENT.Spawnable = true
ENT.Category = "Bitminers"

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 1, "ShouldAnimate" )

end
