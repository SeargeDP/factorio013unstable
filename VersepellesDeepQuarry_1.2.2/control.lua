require("util")
require("config")

---------------------------------------------------------
-- Constants
local deep_quarry_period = 61		-- how often to perform mining, in ticks
local advanced_quarry_period = 29	-- how often to perform advanced mining, in ticks


---------------------------------------------------------
-- Process all ongoing events
function onTick()
	if not mixed_ores then populateMixedOreList() end
	
	if (game.tick % deep_quarry_period == 0) then
		processQuarries(global.deep_quarries)
	end
	if (game.tick % advanced_quarry_period == 0) then
		processQuarries(global.advanced_quarries)
	end
end

function populateMixedOreList()
	mixed_ores = {}
	for __, ore in pairs(potential_ores) do
		if game.item_prototypes[ore] then
			table.insert(mixed_ores, ore)
		end
	end
end

---------------------------------------------------------
-- Initialize various objects
function onInit()
	global.deep_quarries = global.deep_quarries or {}
	global.advanced_quarries = global.advanced_quarries or {}
	script.on_event(defines.events.on_tick, onTick)
end
script.on_init(onInit)

---------------------------------------------------------
-- On reload, make sure that processing continues
function onLoad()
	script.on_event(defines.events.on_tick, onTick)
end
script.on_load(onLoad)

---------------------------------------------------------
-- On mod update, 
function onConfigurationChange(change_data)
	if global.quarries then
		global.deep_quarries = util.table.deepcopy(global.quarries)
		global.quarries = nil
	end
	global.deep_quarries = global.deep_quarries or {}
	global.advanced_quarries = global.advanced_quarries or {}
	script.on_event(defines.events.on_tick, onTick)
end
script.on_configuration_changed(onConfigurationChange)

---------------------------------------------------------
-- Keep track of built objects
function builtEntity(event)
	local ent = event.created_entity
	local name = ent.name
	if name == "deep-quarry" then
		table.insert(global.deep_quarries, ent)
	elseif name == "advanced-quarry" then
		table.insert(global.advanced_quarries, ent)
	end
end
script.on_event(defines.events.on_built_entity, builtEntity)
script.on_event(defines.events.on_robot_built_entity, builtEntity)

---------------------------------------------------------
-- Simulate mining in deep quarries
function processQuarries(quarries)
	for index, quarry in pairs(quarries) do
		if quarry and quarry.valid then
			local inventory = quarry.get_inventory(defines.inventory.item_main)
			if result_ore == "mixed" then
				ore = insertRandomOre(inventory, ore_per_second)
			else
				inventory.insert({name = result_ore, count = ore_per_second})
			end
			quarry.surface.pollute(quarry.position, deep_mining_pollution)
		else
			table.remove(quarries, index)
		end
	end
end

---------------------------------------------------------
-- Random ore if the quarry gives "mixed" ore
function insertRandomOre(inventory)
	for i = 1, ore_per_second do
		inventory.insert({name = mixed_ores[math.random(1, #mixed_ores)], count = 1})
	end
end