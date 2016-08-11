data:extend({

  {
    type = "recipe",
    name = "algae",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients = 
    {
      {type="fluid", name="water", amount=5},
      {type="fluid", name="fertilizer", amount=3}
    },
    results = 
    {
      {type="item", name="algae", amount=2}
    }
  },
  
  {
    type = "recipe",
    name = "fertilizer",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"sulfur", 1},
      {"stone", 4}
    },
    results =
    {
      {type="fluid", name="fertilizer", amount=3}
    }
  },
  
  {
    type = "recipe",
    name = "biodiesel",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"algae", 1},
      {type="fluid", name="water", amount=10}
    },
    results =
    {
      {type="fluid", name="biodiesel", amount=4}
    },
  },

  {
    type = "recipe",
    name = "solid-fuel-from-biodiesel",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    icon = "__Algaculture__/graphics/icons/solid-fuel-biodiesel.png",
    ingredients =
    {
      {type="fluid", name="biodiesel", amount=2}
    },
    results =
    {
      {"solid-fuel", 1}
    }
  },
    {
    type = "recipe",
    name = "nutrient-paste",
    category = "smelting",
    enabled = false,
    energy_required = 17.5,
    ingredients = 
  {
    {"algae", 6}
  },
    results = 
    {
    {"nutrient-paste", 1}
    }
  }
})