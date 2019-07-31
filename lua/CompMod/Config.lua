local modules = {
	--[[
	  ============================
			Alien Modules
	  ============================
	]]

	"Alien/Biomass",

		-- Drifter Modules
		"Alien/Drifters/BlueprintPopFix",

		-- Egg Modules
		"Alien/Eggs/EmbryoHP",
		"Alien/Eggs/HiveEggHeal",
		"Alien/Eggs/LifeformEggDrops",

		-- Lifeform Modules

			-- Fade Modules
			"Alien/Lifeforms/Fade/AdvancedMetabolize",
			"Alien/Lifeforms/Fade/AdvancedSwipe",
			"Alien/Lifeforms/Fade/Stab",

			-- Gorge Modules
				-- Web Modules
				"Alien/Lifeforms/Gorge/Webs/DestroyOnTouch",

			-- Lerk Modules
			"Alien/Lifeforms/Lerk/Spores",

			-- Onos Modules
				-- BoneShield Modules
				"Alien/Lifeforms/Onos/BoneShield/ConsumeRate",
				"Alien/Lifeforms/Onos/BoneShield/UIBar",

			"Alien/Lifeforms/Onos/Stomp",

	"Alien/ShellHealSound",

		-- Structure Modules
		"Alien/Structures/Cyst",
		"Alien/Structures/GorgeTunnels",
		"Alien/Structures/Harvester",

	"Alien/SupplyChanges",

	--[[
	  ==========================
			Global Modules
	  ==========================
	]]

	"Global/Bindings",
	"Global/HealthBars",
	"Global/ReadyRoomPanels",
	"Global/SupplyDisplay",

	--[[
	  ==========================
			Marine Modules
	  ==========================
	]]

	"Marine/MarinePresenceSlowsWeaponDecay",
	"Marine/PowerSurge",

	-- Structure Modules
		-- ARCs
		"Marine/Structures/ARC/ARCCorrodeBugFix",

	"Marine/SupplyChanges",
	"Marine/Walk",

		-- Weapons
		"Marine/Weapons/AxeHitFix",

			-- Grenades
			"Marine/Weapons/Grenades/GrenadeQuickThrow",

	--[[
	  ==============================
	  		Spectator Modules
	  ==============================
	]]
	"Spectator/KillFeedFix",
}

function GetModConfig(kLogLevels)
	local config = {}

	config.kLogLevel = kLogLevels.info
	config.kShowInFeedbackText = true
	config.kModVersion = "2"
	config.kModBuild = "6.5"
	config.disableRanking = true
	config.use_config = "none"

	config.techIdsToAdd = {
		"AdvancedSwipe",
	}

	config.modules = modules

	return config
end
