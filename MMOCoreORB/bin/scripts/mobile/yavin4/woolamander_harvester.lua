woolamander_harvester = Creature:new {
	objectName = "@mob/creature_names:woolamander_harvester",
	socialGroup = "woolamander",
	faction = "",
	level = 38,
	chanceHit = 0.43,
	damageMin = 335,
	damageMax = 380,
	baseXp = 3733,
	baseHAM = 9100,
	baseHAMmax = 11100,
	armor = 0,
	resists = {25,25,-1,180,180,180,-1,-1,-1},
	meatType = "meat_carnivore",
	meatAmount = 123,
	hideType = "hide_wooly",
	hideAmount = 123,
	boneType = "bone_mammal",
	boneAmount = 123,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/woolamander_hue.iff"},
	scale = 1.1,
	lootGroups = {
    {
      groups = {
        {group = "harrower_bone", chance = 10000000}
      },
      lootChance = 2020000
    }
  },
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareaattack",""},
		{"dizzyattack",""}
	}
}

CreatureTemplates:addCreatureTemplate(woolamander_harvester, "woolamander_harvester")
