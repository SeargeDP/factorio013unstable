data:extend(
{
	{
		type = "technology",
		name = "deep-quarry",
		icon = "__VersepellesDeepQuarry__/graphics/icons/deep-quarry-tech.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "deep-quarry"
			},
		},
		prerequisites = {"advanced-electronics"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
			},
			time = 60
		},
		order = "z"
	},
	{
		type = "technology",
		name = "advanced-quarry",
		icon = "__VersepellesDeepQuarry__/graphics/icons/advanced-quarry-tech.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "advanced-quarry"
			},
		},
		prerequisites = {"electric-engine", "deep-quarry"},
		unit =
		{
			count = 250,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
			},
			time = 60
		},
		order = "z"
	},
})