zmlab = zmlab or {}
zmlab.f = zmlab.f or {}


// Used for Debug
function zmlab.f.Debug(mgs)
	if zmlab.config.Debug then
		if istable(mgs) then
			print("[    DEBUG    ] Table Start >")
			PrintTable(mgs)
			print("[    DEBUG    ] Table End <")
		else
			print("[    DEBUG    ] " .. mgs)
		end
	end
end

function zmlab.f.Debug_Sphere(pos,size,lifetime,color,ignorez)
	if zmlab.config.Debug then
		debugoverlay.Sphere( pos, size, lifetime, color, ignorez )
	end
end
