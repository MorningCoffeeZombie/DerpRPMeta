TOOL.Category		= "Construction"
TOOL.Name			= "#Simple Collide"
TOOL.Author			= "MorningCoffeeZombie"
TOOL.Command		= nil
TOOL.ConfigName		= ""

-- COLLISION_GROUP_NONE sets props back to normal
-- COLLISION_GROUP_WORLD sets props to very no-collided

if CLIENT then
	language.Add("Tool.simplecollide.name", "Simple Collide")
	language.Add("Tool.simplecollide.desc", "Control all collision attributes in one simple tool.")
	language.Add("Tool.simplecollide.0", "Left click on a prop to toggle basic collisions. Right click on a prop to toggle world collisions")
end

-- Handle BASIC collisions
function TOOL:LeftClick( trace )
	if (!trace.Entity ) then return end
	if (!trace.Entity:IsValid()) then return end
	if (trace.Entity:IsPlayer()) then return end
	local PhysObj = trace.Entity:GetPhysicsObject()
	
	if ( CLIENT ) then return true end	
	if ( trace.Entity:GetCollisionGroup() == COLLISION_GROUP_WORLD ) then
		trace.Entity:SetCollisionGroup( COLLISION_GROUP_NONE )
	else
		trace.Entity:SetCollisionGroup( COLLISION_GROUP_WORLD )
	end
end

-- Handle WORLD baed collisions
function TOOL:RightClick( trace )
	if (!trace.Entity ) then return end
	if (!trace.Entity:IsValid()) then return end
	if (trace.Entity:IsPlayer()) then return end
	
	local PhysObj = trace.Entity:GetPhysicsObject()
	
	if ( CLIENT ) then return true end
	
	-- NO COLLISIONS
	if ( trace.Entity.CollisionGroup != COLLISION_GROUP_WORLD ) then
		trace.Entity:SetCollisionGroup( COLLISION_GROUP_WORLD )
		trace.Entity.CollisionGroup = COLLISION_GROUP_WORLD
		PhysObj:EnableCollisions(true)
	end
	return true
	
	-- COLLISIONS
	if ( trace.Entity.CollisionGroup == COLLISION_GROUP_WORLD ) then
		trace.Entity:SetCollisionGroup( COLLISION_GROUP_NONE )
		trace.Entity.CollisionGroup = COLLISION_GROUP_NONE
		PhysObj:EnableCollisions(false)
	end
	return true
end

-- Enable all collisions with reload key (R)
function TOOL:Reload( trace )
	if ( !IsValid( trace.Entity ) || trace.Entity:IsPlayer() ) then return false end
	if ( CLIENT ) then return true end
	return trace.Entity:SetCollisionGroup( COLLISION_GROUP_WORLD )
	return constraint.RemoveConstraints( trace.Entity, "NoCollide" )
end

function TOOL:Holster()
	self:ClearObjects()
end


