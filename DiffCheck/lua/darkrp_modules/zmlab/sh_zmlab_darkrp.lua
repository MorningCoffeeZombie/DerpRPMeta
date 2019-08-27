TEAM_ZMLAB_COOK = DarkRP.createJob("Master Meth Cook", {
	color = Color(0, 128, 255, 255),
	model = {"models/player/gasmaskcitizen/gasmask_civi_01playermodel.mdl"},
	description = [[You are a Master manufacture of Methamphetamine]],
	weapons = {"zmlab_extractor"},
	command = "zmlab_MethCook",
	max = 4,
	--salary = 0,	--Default
	salary = 50,
	admin = 0,
	vote = false,
	category = "Production",
	hasLicense = false
})

DarkRP.createCategory{
	name = "Meth Production",
	categorises = "entities",
	startExpanded = true,
	color = Color(0, 107, 0, 255),
	canSee = function(ply) return true end,
	sortOrder = 103
}

DarkRP.createEntity("Combiner", {
	ent = "zmlab_combiner",
	model = "models/zerochain/zmlab/zmlab_combiner.mdl",
	--price = 6000,	--Default
	price = 7500,
	max = 2,
	cmd = "buycombiner_zmlab",
	allowed = TEAM_ZMLAB_COOK,
	category = "Meth Production",
	delay = 0.5
})

DarkRP.createEntity("Gas Filter", {
	ent = "zmlab_filter",
	model = "models/zerochain/zmlab/zmlab_filter.mdl",
	--price = 1000,	--Default
	price = 1750,
	max = 3,
	cmd = "buyfilter_zmlab",
	allowed = TEAM_ZMLAB_COOK,
	category = "Meth Production",
	delay = 0.5
})

DarkRP.createEntity("Frezzer", {
	ent = "zmlab_frezzer",
	model = "models/zerochain/zmlab/zmlab_frezzer.mdl",
	price = 1000,
	max = 2,
	cmd = "buyfrezzer_zmlab",
	allowed = TEAM_ZMLAB_COOK,
	category = "Meth Production",
	delay = 0.5
})

DarkRP.createEntity("Transport Crate", {
	ent = "zmlab_collectcrate",
	model = "models/zerochain/zmlab/zmlab_transportcrate.mdl",
	--price = 250,	--Default
	price = 200,
	max = 5,
	cmd = "buycollectcrate_zmlab",
	allowed = TEAM_ZMLAB_COOK,
	category = "Meth Production",
	delay = 0.5
})

DarkRP.createEntity("Methylamin", {
	ent = "zmlab_methylamin",
	model = "models/zerochain/zmlab/zmlab_methylamin.mdl",
	--price = 1000,	--Default
	price = 1500,
	max = 6,
	cmd = "buymethylamin_zmlab",
	allowed = TEAM_ZMLAB_COOK,
	category = "Meth Production",
	delay = 0.5
})

DarkRP.createEntity("Aluminium", {
	ent = "zmlab_aluminium",
	model = "models/zerochain/zmlab/zmlab_aluminiumbox.mdl",
	--price = 100,	--Default
	price = 700,
	max = 6,
	cmd = "buyaluminium_zmlab",
	allowed = TEAM_ZMLAB_COOK,
	category = "Meth Production",
	delay = 0.5
})

DarkRP.createEntity("Transport Palette", {
	ent = "zmlab_palette",
	model = "models/props_junk/wood_pallet001a.mdl",
	--price = 100,	--Default
	price = 400,
	max = 3,
	cmd = "buypalette_zmlab",
	allowed = TEAM_ZMLAB_COOK,
	category = "Meth Production",
	delay = 0.5
})
