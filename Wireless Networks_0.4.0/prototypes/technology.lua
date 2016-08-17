data:extend({
  {
    type = "technology",
    name = "wireless-networks",
    icon = "__Wireless Networks__/graphics/technology/wireless-networks.png",
    icon_size = 128,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "wireless-mast"
      }
    },
    prerequisites = {"circuit-network"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 1},
      },
      time = 10
    },
    order = "a-d-e",
  }
})