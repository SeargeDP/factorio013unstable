data:extend({
  {
    type = "technology",
    name = "pollution-detection",
    icon = "__pollution-detector__/graphics/technology/pollution-detection.png",
    prerequisites = {"plastics", "advanced-electronics"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pollution-detector"
      }
    },
    unit =
    {
      count = 100,
      ingredients = {
        {"science-pack-1", 1},
        {"science-pack-2", 1}
      },
      time = 30
    },
    order = "d-a-a"
  }
})
