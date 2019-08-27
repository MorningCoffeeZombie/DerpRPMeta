if not SERVER then return end
zmlab = zmlab or {}
zmlab.f = zmlab.f or {}

function zmlab.f.GiveMoney(ply, money)
	-- Give the player the Cash
	if (DarkRP) then
		ply:addMoney(money)
	elseif (nut) then
		ply:getChar():giveMoney(money)
	elseif (BaseWars) then
		ply:GiveMoney(money)
	end
end

function zmlab.f.TakeMoney(ply, money)
	-- Give the player the Cash
	if (DarkRP) then
		ply:addMoney(-money)
	elseif (nut) then
		ply:getChar():takeMoney(money)
	elseif (BaseWars) then
		ply:GiveMoney(-money)
	end
end

function zmlab.f.HasMoney(ply, money)

	if (DarkRP) then
		if ((ply:getDarkRPVar("money") or 0) >= money) then
			return true
		else
			return false
		end
	elseif (nut) then
		if (ply:getChar():hasMoney(money)) then
			return true
		else
			return false
		end
	elseif (BaseWars) then
		if ((ply:GetMoney() or 0) >= money) then
			return true
		else
			return false
		end
	elseif ( engine.ActiveGamemode() == "sandbox") then
		return true
	end
end
