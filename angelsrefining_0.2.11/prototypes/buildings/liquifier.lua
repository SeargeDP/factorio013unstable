data:extend(
  {
  {
    type = "item",
    name = "liquifier",
    icon = "__angelsrefining__/graphics/icons/liquifier.png",
    flags = {"goes-to-quickbar"},
    subgroup = "refining-buildings",
    order = "e[liquifier]",
    place_result = "liquifier",
    stack_size = 10,
  },
  {
    type = "assembling-machine",
    name = "liquifier",
    icon = "__angelsrefining__/graphics/icons/liquifier.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "liquifier"},
	fast_replaceable_group = "liquifier",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"liquifying"},
    crafting_speed = 1.5,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "150kW",
    ingredient_count = 4,
    animation ={
	layers={
    {
        filename = "__angelsrefining__/graphics/entity/liquifier/liquifier.png",
        width = 160,
        height = 160,
		line_length = 10,
        frame_count = 30,
        shift = {0, 0},
		animation_speed = 0.75,
    },
	-- {
        -- filename = "__angelsrefining__/graphics/entity/7x7-overlay.png",
		-- tint = {r=1, g=0, b=0},
        -- width = 224,
        -- height = 224,
        -- frame_count = 1,
        -- shift = {0, 0},
    -- },
	}
	},
     vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
		--pipe_picture = liquifierpipepictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -2} }}
      }
    },
    pipe_covers = pipecoverspictures(),
	--off_when_no_fluid_recipe = true
    },
    {
    type = "item",
    name = "liquifier-2",
    icon = "__angelsrefining__/graphics/icons/liquifier.png",
    flags = {"goes-to-quickbar"},
    subgroup = "refining-buildings",
    order = "e[liquifier-2]",
    place_result = "liquifier-2",
    stack_size = 10,
    },
    {
    type = "assembling-machine",
    name = "liquifier-2",
    icon = "__angelsrefining__/graphics/icons/liquifier.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "liquifier-2"},
	fast_replaceable_group = "liquifier",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"liquifying"},
    crafting_speed = 2.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "100kW",
    ingredient_count = 4,
    animation ={
	layers={
    {
        filename = "__angelsrefining__/graphics/entity/liquifier/liquifier.png",
        width = 160,
        height = 160,
		line_length = 10,
        frame_count = 30,
        shift = {0, 0},
		animation_speed = 0.75,
    },
	-- {
        -- filename = "__angelsrefining__/graphics/entity/7x7-overlay.png",
		-- tint = {r=1, g=0, b=0},
        -- width = 224,
        -- height = 224,
        -- frame_count = 1,
        -- shift = {0, 0},
    -- },
	}
	},
     vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
		--pipe_picture = liquifierpipepictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {0, -2} }}
      }
    },
    pipe_covers = pipecoverspictures(),
	--off_when_no_fluid_recipe = true
    },
}
)