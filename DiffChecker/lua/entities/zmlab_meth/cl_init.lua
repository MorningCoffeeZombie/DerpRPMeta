include("shared.lua")

function ENT:Draw()
	self:DrawModel()
	if zmlab.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 200) then
		self:DrawInfo()
	end
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:DrawInfo()
	local Pos = self:GetPos() + Vector(0, 0, 20)
	local Ang = Angle(0, LocalPlayer():EyeAngles().y - 90, 90)
	cam.Start3D2D(Pos, Ang, 0.1)
		draw.DrawText(math.Round(self:GetMethAmount()) .. zmlab.config.UoW, "zmlab_font4", 0, 5, zmlab.default_colors["white01"], TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
