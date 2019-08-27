include("shared.lua")

function ENT:Draw()
	self:DrawModel()

	if zmlab.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 300) and IsValid(self:GetCombinerEnt()) then
		cam.Start3D2D(self:LocalToWorld(Vector(0,17,34)), self:LocalToWorldAngles(Angle(0,180,90)), 0.1)
			draw.DrawText("[E]", "zmlab_font4", 0, 5, zmlab.default_colors["white01"], TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end
end

function ENT:DrawTranslucent()
	self:Draw()
end

function ENT:Initialize()
	self.LastCombiner = NULL
	self.LastCombiner_Stage = -1
	self.LastHealth = -1
end

function ENT:Think()
	if zmlab.f.InDistance(LocalPlayer():GetPos(), self:GetPos(), 600) then

		-- Attach sounds
		local curCombiner = self:GetCombinerEnt()
		if curCombiner ~= self.LastCombiner then
			self.LastCombiner = curCombiner

			if IsValid(self.LastCombiner) then
				self:EmitSound("filter_attach")
			else
				self:EmitSound("filter_dettach")
			end
		end

		-- Animation
		if IsValid(self.LastCombiner) then
			local combinerStage = self.LastCombiner:GetStage()
			if combinerStage ~= self.LastCombiner_Stage then

				if combinerStage == 5 then
					zmlab.f.ClientAnim(self, "run", 1)
				else
					zmlab.f.ClientAnim(self, "idle", 1)
				end

				self.LastCombiner_Stage = combinerStage
			end
		else
			zmlab.f.ClientAnim(self, "idle", 1)
			self.LastCombiner_Stage = -1
		end

		-- Health Skins
		local health = self:GetFilterHealth()
		if self.LastHealth ~= health then

			if health <= 0 then
				self:EmitSound("filter_break")
			elseif health < zmlab.config.Filter.Health * 0.4 then
				self:SetSkin(2)
			elseif health < zmlab.config.Filter.Health * 0.75 then
				self:SetSkin(1)
			end

			self.LastHealth = health
		end
	else
		self.LastCombiner_Stage = -1
		self.LastHealth = -1
	end
	self:SetNextClientThink(CurTime())
	return true
end
