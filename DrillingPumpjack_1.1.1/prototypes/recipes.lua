data:extend(
	{
		---------------------------------------------------------------------------------
		{
			type = "recipe-category",
			name = "oil-production"
		},
		---------------------------------------------------------------------------------
		{
			type = "recipe",
			name = "drilling-pumpjack",
			enabled = false,
			energy_required = 5,
			ingredients =
			{
				{"steel-plate", 30},
				{"pumpjack", 1},
				{"electronic-circuit", 20},
				{"pipe", 5},
			},
			result = "drilling-pumpjack"
		},
		{
			type = "recipe",
			name = "drilling-pumpjack-mk2",
			enabled = false,
			energy_required = 10,
			ingredients =
			{
				{"steel-plate", 50},
				{"drilling-pumpjack", 1},
				{"advanced-circuit", 20},
				{"pipe", 10},
			},
			result = "drilling-pumpjack-mk2"
		},
		{
			type = "recipe",
			name = "drilling-pumpjack-mk3",
			enabled = false,
			energy_required = 10,
			ingredients =
			{
				{"steel-plate", 100},
				{"drilling-pumpjack-mk2", 1},
				{"processing-unit", 20},
				{"pipe", 50},
			},
			result = "drilling-pumpjack-mk3"
		},
		---------------------------------------------------------------------------------
		{
			type = "recipe",
			name = "oil-flow",
			enabled = true,
			hidden = true,
			energy_required = 1, 
			category = "oil-production",
			ingredients =
			{
			},
			results=
			{
				{type="fluid", name="crude-oil", amount=1},
			},
		},
	}
)

