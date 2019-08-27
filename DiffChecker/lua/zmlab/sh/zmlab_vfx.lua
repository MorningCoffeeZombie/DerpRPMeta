zmlab = zmlab or {}
zmlab.f = zmlab.f or {}

if SERVER then
	// Animation
	util.AddNetworkString("zmlab_AnimEvent")
	function zmlab.f.CreateAnimTable(prop, anim, speed)
		if IsValid(prop) then
			net.Start("zmlab_AnimEvent")
			net.WriteString(anim)
			net.WriteFloat(speed)
			net.WriteEntity(prop)
			net.SendPVS(prop:GetPos())
		end
	end

	//Effects
	util.AddNetworkString("zmlab_FX")
	function zmlab.f.CreateEffect(effect, ent, angle, position, attach)
		net.Start("zmlab_FX")
		net.WriteString(effect)
		net.WriteVector(position)
		net.WriteAngle(angle)
		net.WriteEntity(ent)
		net.WriteInt(attach, 5)
		net.SendPVS(ent:GetPos())
	end

	util.AddNetworkString("zmlab_SFX")
	function zmlab.f.CreateSoundEffect(sound, ent)
		net.Start("zmlab_SFX")
		net.WriteString(sound)
		net.WriteEntity(ent)
		net.SendPVS(ent:GetPos())
	end


	util.AddNetworkString("zmlab_clean_fx")
	function zmlab.f.CreateCleanEffect(ent, position)
		net.Start("zmlab_clean_fx")
		net.WriteVector(position)
		net.WriteEntity(ent)
		net.SendPVS(ent:GetPos())
	end



	util.AddNetworkString("zmlab_remove_FX")
	function zmlab.f.RemoveEffectNamed(prop, effect)
		net.Start("zmlab_remove_FX")
		local effectInfo = {}
		effectInfo.effect = effect
		effectInfo.parent = prop
		net.WriteTable(effectInfo)
		net.SendPVS(prop:GetPos())
	end

	//Screeneffects
	util.AddNetworkString("zmlab_screeneffect")
	function zmlab.f.CreateScreenEffectTable(ply)
		net.Start("zmlab_screeneffect")
		net.Send(ply)
	end
end

if CLIENT then
	// Animation
	function zmlab.f.ClientAnim(prop, anim, speed)
		local sequence = prop:LookupSequence(anim)
		prop:SetCycle(0)
		prop:ResetSequence(sequence)
		prop:SetPlaybackRate(speed)
		prop:SetCycle(0)
	end

	net.Receive("zmlab_AnimEvent", function(len, ply)
		local anim = net.ReadString()
		local speed = net.ReadFloat()
		local prop = net.ReadEntity()

		if anim and speed and IsValid(prop) then
			zmlab.f.ClientAnim(prop, anim, speed)
		end
	end)

	// Effects
	net.Receive("zmlab_FX", function(len)

		local effect = net.ReadString()
		local position = net.ReadVector()
		local angle = net.ReadAngle()
		local ent = net.ReadEntity()
		local attach = net.ReadInt(5)

		if IsValid(ent) and GetConVar("zmlab_cl_vfx_particleeffects"):GetInt() == 1 and effect then
			if attach > 0 then
				ParticleEffectAttach(effect, PATTACH_POINT_FOLLOW, ent, attach)
			else
				ParticleEffect(effect, position, angle, ent)
			end
		end
	end)

	net.Receive("zmlab_SFX", function(len)

		local sound = net.ReadString()
		local ent = net.ReadEntity()

		if IsValid(ent) and sound then
			ent:EmitSound(sound)
		end
	end)

	net.Receive("zmlab_clean_fx", function(len)

		local pos = net.ReadVector()
		local ent = net.ReadEntity()
		if pos and IsValid(ent) then
			ParticleEffect("zmlab_cleaning", pos, ent:GetAngles(), ent)
			ent:EmitSound("Combiner_cleaning")
		end
	end)

	net.Receive("zmlab_remove_FX", function(len, ply)
		local effectInfo = net.ReadTable()

		if (effectInfo and IsValid(effectInfo.parent) and effectInfo.effect) then
			effectInfo.parent:StopParticlesNamed(effectInfo.effect)
		end
	end)

	// Screeneffects
	local screeneffect_duration = 0
	local ScreenEffectAmount = 0

	//Starts our screeneffect
	net.Receive("zmlab_screeneffect", function(len)
		screeneffect_duration = zmlab.config.Meth.EffectDuration
		ScreenEffectAmount = zmlab.config.Meth.EffectDuration * 100
	end)

	//Stops our screeneffect
	net.Receive("zmlab_stop_screeneffects", function(len, ply)
		screeneffect_duration = 0
		ScreenEffectAmount = 0
	end)

	if timer.Exists("zmlab_screeneffect_counter") then
		timer.Remove("zmlab_screeneffect_counter")
	end
	timer.Create("zmlab_screeneffect_counter", 0.1, 0, function()
		if (ScreenEffectAmount or 0) > 0 then
			ScreenEffectAmount = ScreenEffectAmount - 10

		else
			if (screeneffect_duration > 0) then
				screeneffect_duration = 0
			end

			if (ScreenEffectAmount > 0) then
				ScreenEffectAmount = 0
			end

			if IsValid(LocalPlayer()) then
				LocalPlayer():SetDSP(0)
			end
		end
	end)


	local lastSoundStop

	function zmlab.f.MethMusic()
		local ply = LocalPlayer()

		if ScreenEffectAmount > 0 then
			if ply.zmlab_MethSoundObj == nil then
				ply.zmlab_MethSoundObj = CreateSound(ply, "sfx_meth_consum_music")
			end

			if ply.zmlab_MethSoundObj:IsPlaying() == false then
				ply.zmlab_MethSoundObj:Play()
				ply.zmlab_MethSoundObj:ChangeVolume(0, 0)
				ply.zmlab_MethSoundObj:ChangeVolume(1, 2)
			end
		else
			if ply.zmlab_MethSoundObj == nil then
				ply.zmlab_MethSoundObj = CreateSound(ply, "sfx_meth_consum_music")
			end

			if ply.zmlab_MethSoundObj:IsPlaying() == true then
				ply.zmlab_MethSoundObj:ChangeVolume(0, 2)
				if ((lastSoundStop or CurTime()) > CurTime()) then return end
				lastSoundStop = CurTime() + 3

				timer.Simple(2, function()
					if (IsValid(ply)) then
						ply.zmlab_MethSoundObj:Stop()
					end
				end)
			end
		end
	end

	hook.Add("RenderScreenspaceEffects", "zmlab_RenderScreenspaceEffects", function()
		if zmlab.config.Meth.EffectMusic then
			zmlab.f.MethMusic()
		end

		if (ScreenEffectAmount or 0) > 0 then
			local alpha = 1 / (100 * screeneffect_duration) * ScreenEffectAmount

			LocalPlayer():SetDSP(3)

			DrawBloom(alpha * 0.3, alpha * 2, alpha * 8, alpha * 8, 15, 1, 0, 0.8, 1)
			DrawMotionBlur(0.1 * alpha, alpha, 0)
			DrawSharpen(0.2 * alpha, 10 * alpha)
			DrawSunbeams(1 * alpha, 0.1 * alpha, 0.08 * alpha, 0, 0)

			DrawMaterialOverlay("effects/tp_eyefx/tpeye3", -0.2 * alpha)
			DrawMaterialOverlay("effects/water_warp01", 0.1 * alpha)

			local tab = {}
			tab["$pp_colour_colour"] = 1
			tab["$pp_colour_contrast"] = math.Clamp(2 * alpha, 1, 2)
			tab["$pp_colour_brightness"] = math.Clamp(-0.3 * alpha, -1, 1)
			tab["$pp_colour_addb"] = 0.3 * alpha
			tab["$pp_colour_addg"] = 0.2 * alpha
			DrawColorModify(tab)

		end
	end)
end
