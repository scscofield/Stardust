chemilizard = Creature:new {	customName = "a Chemilizard",	socialGroup = "voritor",	faction = "",	level = 27,	chanceHit = 0.24,	damageMin = 940,	damageMax = 1245,	baseXp = 62,	baseHAM = 11300,	baseHAMmax = 60080,	armor = 1,	resists = {0,0,0,0,0,0,0,0,0},	meatType = "",	meatAmount = 3,	hideType = "",	hideAmount = 3,	boneType = "",	boneAmount = 3,	milk = 0,	tamingChance = 0,	ferocity = 0,	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,  creatureBitmask = PACK,  optionsBitmask = AIENABLED,  diet = CARNIVORE,	templates = {"object/mobile/bolotaur.iff"},	lootGroups = {},	weapons = {},	conversationTemplate = "",	attacks = {	  {"stunattack",""},    {"strongpoison",""}	}}CreatureTemplates:addCreatureTemplate(chemilizard, "chemilizard")