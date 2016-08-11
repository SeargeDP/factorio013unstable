data:extend(
{
  {
    type = "technology",
    name = "advanced-oil-extraction",
    icon = "__base__/graphics/technology/oil-gathering.png",
    upgrade = "true",
    prerequisites = {"advanced-oil-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "drilling-pumpjack"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
		{{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 1}},
      time = 30
    },
    order = "d-a-d-2"
  },
  {
    type = "technology",
    name = "advanced-oil-extraction-mk2",
    icon = "__base__/graphics/technology/oil-gathering.png",
    upgrade = "true",
    prerequisites = {"advanced-oil-extraction"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "drilling-pumpjack-mk2"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
		{{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 2}},
      time = 60
    },
    order = "d-a-d-2"
  },
  {
    type = "technology",
    name = "advanced-oil-extraction-mk3",
    icon = "__base__/graphics/technology/oil-gathering.png",
    upgrade = "true",
    prerequisites = {"advanced-oil-extraction-mk2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "drilling-pumpjack-mk3"
      }
    },
    unit =
    {
      count = 100,
      ingredients =
		{{"science-pack-1", 3},
		{"science-pack-2", 3},
		{"science-pack-3", 2},
		{"alien-science-pack", 1}},
      time = 60
	},
    order = "d-a-d-2"
  },
})