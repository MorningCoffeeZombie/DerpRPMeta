ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Lean Small Crate"
ENT.Category = "Lean-Production"
ENT.Author = "CL34R"
ENT.Spawnable = true

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "holding")
    self:NetworkVar("Bool", 0, "full")
end
