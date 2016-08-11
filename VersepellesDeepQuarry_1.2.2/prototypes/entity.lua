require("util")

local ent  -- placeholder for building each entity

-- Deep Quarry
ent = util.table.deepcopy(data.raw["container"]["steel-chest"])
ent.name = "deep-quarry"
ent.minable.result = "deep-quarry"
ent.corpse = "big-remnants"
ent.collision_box = {{-1.4, -1.4}, {1.4, 1.4}}
ent.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
ent.icon = "__VersepellesDeepQuarry__/graphics/icons/deep-quarry.png"
ent.picture = 
	{
	  filename = "__VersepellesDeepQuarry__/graphics/entity/deep-quarry/deep-quarry.png",
	  width = 156,
	  height = 127,
	  shift = {0.95, 0.2}
	}
ent.inventory_size = 10
data:extend({ent})

-- Advanced Quarry
ent = util.table.deepcopy(data.raw["container"]["steel-chest"])
ent.name = "advanced-quarry"
ent.minable.result = "advanced-quarry"
ent.corpse = "big-remnants"
ent.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
ent.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
ent.icon = "__VersepellesDeepQuarry__/graphics/icons/advanced-quarry.png"
ent.picture = 
	{
	  filename = "__VersepellesDeepQuarry__/graphics/entity/advanced-quarry/advanced-quarry.png",
	  width = 116,
	  height = 93,
	  shift = { 0.34375, 0.046875}
	}
ent.inventory_size = 20
data:extend({ent})