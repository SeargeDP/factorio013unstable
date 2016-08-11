data:extend(
{
  {
    type = "technology",
    name = "barrel-all",
    icon = "__base__/graphics/icons/fluid/empty-barrel.png",
    unit =
    {
      count = 10,
      ingredients =      {        {"science-pack-1", 1},      },
      time = 60
    },
    effects =
    {
 {type = "unlock-recipe",recipe = "fill-heavy-oil-barrel"}
,{type = "unlock-recipe",recipe = "empty-heavy-oil-barrel"}
,{type = "unlock-recipe",recipe = "fill-light-oil-barrel"}
,{type = "unlock-recipe",recipe = "empty-light-oil-barrel"}
,{type = "unlock-recipe",recipe = "fill-lubricant-barrel"}
,{type = "unlock-recipe",recipe = "empty-lubricant-barrel"}
,{type = "unlock-recipe",recipe = "fill-petroleum-gas-barrel"}
,{type = "unlock-recipe",recipe = "empty-petroleum-gas-barrel"}
,{type = "unlock-recipe",recipe = "fill-sulfuric-acid-barrel"}
,{type = "unlock-recipe",recipe = "empty-sulfuric-acid-barrel"}
,{type = "unlock-recipe",recipe = "fill-water-barrel"}
,{type = "unlock-recipe",recipe = "empty-water-barrel"}
    },
    upgrade = true,
    order = "e-n-f"
  } 
}
)