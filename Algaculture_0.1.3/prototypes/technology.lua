data:extend({

  {
    type = "technology",
    name = "algae-processing",
    icon = "__Algaculture__/graphics/technologies/algae-tech.png",
    icon_size = 128,
    effects =
      {
        {
          type = "unlock-recipe",
          recipe = "algae"
        },
	{
          type = "unlock-recipe",
	  recipe = "fertilizer"
        }
      },
    prerequisites = {"sulfur-processing"},
    unit = 
      {
        count = 100,
        ingredients =
        {
          {"science-pack-1", 1},
          {"science-pack-2", 1}
        },
        time = 30
      }
    },
    
  {
    type = "technology",
    name = "biodiesel",
    icon = "__Algaculture__/graphics/technologies/biodiesel-tech.png",
    icon_size = 128,
    effects =
      {
        {
          type = "unlock-recipe",
          recipe = "biodiesel"
        },
	{
	  type = "unlock-recipe",
	  recipe = "solid-fuel-from-biodiesel"
	}
      },
    prerequisites = {"algae-processing"},
    unit = 
      {
        count = 50,
        ingredients =
        {
          {"science-pack-1", 2},
          {"science-pack-2", 2},
	  {"science-pack-3", 1}
        },
        time = 30
      }
    },
  {
    type = "technology",
    name = "nutrient-paste",
    icon = "__Algaculture__/graphics/technologies/nutrient-tech.png",
    icon_size = 128,
    effects =
      {
        {
          type = "unlock-recipe",
          recipe = "nutrient-paste"
        }
      },
    prerequisites = {"algae-processing"},
    unit = 
      {
        count = 100,
        ingredients =
        {
          {"science-pack-1", 1},
          {"science-pack-2", 1}
        },
        time = 30
      }
    },
})