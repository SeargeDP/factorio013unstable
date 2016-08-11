data:extend({
  {
    type = "item",
    name = "deep-quarry",
    icon = "__VersepellesDeepQuarry__/graphics/icons/deep-quarry.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
	place_result = "deep-quarry",
    order = "a[items]-b[electric-mining-drill]-b",
    stack_size = 5,
  },
  {
    type = "item",
    name = "advanced-quarry",
    icon = "__VersepellesDeepQuarry__/graphics/icons/advanced-quarry.png",
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
	place_result = "advanced-quarry",
    order = "a[items]-b[electric-mining-drill]-c",
    stack_size = 5,
  },
})