result_ore = "mixed"					-- Valid options: "mixed", "stone", "coal", "iron-ore", "copper-ore", "alien-artifact"; "bauxite", etc if Bob's mod, etc, are installed
ore_per_second = 2						-- How many ores will be produced per second in each quarry
deep_mining_pollution = 0.03 * 60		-- How much pollution is produced per mining event

-- Add new ores here
potential_ores = {
	-- Vanilla
	"stone",
	"coal",
	"iron-ore",
	"copper-ore",
	-- Angel's Ores
	"angels-ore1",
	"angels-ore2",
	"angels-ore3",
	"angels-ore4",
	"angels-ore5",
	"angels-ore6",
	-- Bob's Mod
	"bauxite-ore",
	"cobalt-ore",
	"gem-ore",
	"gold-ore",
	"lead-ore",
	"nickel-ore",
	"quartz",
	"rutile-ore",
	"silver-ore",
	--"sulfur", -- sulfur appears in vanilla, so we omit it for simplicity
	"tin-ore",
	"tungsten-ore",
	"zinc-ore",
	-- Yuoki Industries
	"y-res1",
	"y-res2",
	-- Various Uranium
	"uraninite",
	"fluorite",
	"uranium-ore",
	-- Dark Matter
	"tenemut",
}