data:extend(
{
--TIER 1
    {
    type = "technology",
    name = "ore-crushing",
    icon = "__angelsrefining__/graphics/technology/mechanical-refining.png",
	icon_size = 128,
	prerequisites =
    {

    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-crusher"
      },
	  {
        type = "unlock-recipe",
        recipe = "ore-sorting-facility"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-crushed"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-crushed"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-crushed"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-crushed"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore1-crushed-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-crushed-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore3-crushed-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-crushed-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-crushed-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-crushed-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-stone"
      },
    },
    unit =
    {
      count = 20,
      ingredients = {
	  {"science-pack-1", 1},
	  },
      time = 15
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "advanced-ore-refining-1",
    icon = "__angelsrefining__/graphics/technology/ore-sorting.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-crushing",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-crusher-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "ore-sorting-facility-2"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crushed"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-crushed"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crushed-processing"
      },
   	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crushed-mix"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-crushed-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crushed-mix1-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crushed-mix2-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crushed-mix3-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crushed-mix4-processing"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1}
	  },
      time = 15
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "geode-processing-1",
    icon = "__angelsrefining__/graphics/technology/geode-processing.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-crushing",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "geode-blue-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-cyan-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-lightgreen-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-purple-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-red-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-yellow-processing"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1}
	  },
      time = 15
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "slag-processing-1",
    icon = "__angelsrefining__/graphics/technology/slag-processing.png",
	icon_size = 64,
	prerequisites =
    {
	"ore-crushing",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "filtration-unit"
      },
	  {
        type = "unlock-recipe",
        recipe = "crystallizer"
      },
	  {
        type = "unlock-recipe",
        recipe = "liquifier"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-3"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crushed-mix-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore7-chunk-mix-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "filter-frame"
      },
	  {
        type = "unlock-recipe",
        recipe = "filter-coal"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-dissolution"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-dissolution-2"
      },
  	  {
        type = "unlock-recipe",
        recipe = "slag-processing-filtering-1"
      },
    },
    unit =
    {
      count = 75,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1}
	  },
      time = 15
    },
    order = "a-a-a1"
    },
--TIER 2
    {
    type = "technology",
    name = "ore-floatation",
    icon = "__angelsrefining__/graphics/technology/hydro-refining.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-crushing",
	"oil-processing"
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-floatation-cell"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore1-chunk"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-chunk"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore3-chunk"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-chunk"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-chunk"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-chunk"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore1-chunk-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-chunk-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore3-chunk-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-chunk-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-chunk-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-chunk-processing"
      },
    },
    unit =
    {
      count = 80,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  },
      time = 30
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "advanced-ore-refining-2",
    icon = "__angelsrefining__/graphics/technology/ore-sorting.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-floatation",
	"advanced-ore-refining-1",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-crusher-3"
      },
	  {
        type = "unlock-recipe",
        recipe = "ore-floatation-cell-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "ore-sorting-facility-3"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-chunk"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-chunk"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-chunk-processing"
      },
   	  {
        type = "unlock-recipe",
        recipe = "angelsore7-chunk-mix"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-chunk-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-chunk-mix1-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-chunk-mix2-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-chunk-mix3-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-chunk-mix4-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-chunk-mix5-processing"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  },
      time = 15
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "geode-processing-2",
    icon = "__angelsrefining__/graphics/technology/geode-processing.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-crushing",
	"geode-processing-1",
	"slag-processing-1",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "geode-blue-liquify"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-cyan-liquify"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-lightgreen-liquify"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-purple-liquify"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-red-liquify"
      },
	  {
        type = "unlock-recipe",
        recipe = "geode-yellow-liquify"
      },
	  {
        type = "unlock-recipe",
        recipe = "crystal-slurry-filtering-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "crystal-slurry-filtering-conversion-1"
      },
    },
    unit =
    {
      count = 75,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1}
	  },
      time = 15
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "slag-processing-2",
    icon = "__angelsrefining__/graphics/technology/slag-processing.png",
	icon_size = 64,
	prerequisites =
    {
	"slag-processing-1",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "filtration-unit-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "crystallizer-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "liquifier-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-4"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-5"
      },
  	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-6"
      },
   	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-7"
      },
   	  {
        type = "unlock-recipe",
        recipe = "slag-processing-angels-8"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crystal-mix-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore7-pure-mix-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "filter-ceramic"
      },
	  {
        type = "unlock-recipe",
        recipe = "filter-ceramic-refurbish"
      },
	  {
        type = "unlock-recipe",
        recipe = "slag-processing-filtering-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "crystal-slurry-filtering-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "crystal-slurry-filtering-conversion-2"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  {"science-pack-3", 1}
	  },
      time = 30
    },
    order = "a-a-a1"
    },
	{
    type = "technology",
    name = "thermal-water-extraction",
    icon = "__angelsrefining__/graphics/technology/thermal-extractor.png",
	icon_size = 128,
	prerequisites =
    {
	"slag-processing-1",
	"advanced-ore-refining-1",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "thermal-extractor"
      },
	  {
        type = "unlock-recipe",
        recipe = "thermal-water-filtering-1"
      },
	  {
        type = "unlock-recipe",
        recipe = "thermal-water-filtering-2"
      },
 	  {
        type = "unlock-recipe",
        recipe = "fill-thermal-water-barrel"
      },
	  {
        type = "unlock-recipe",
        recipe = "empty-thermal-water-barrel"
      },
    },
    unit =
    {
      count = 30,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  {"science-pack-3", 1}
	  },
      time = 15
    },
    order = "a-a-a1"
    },
--TIER 3
    {
    type = "technology",
    name = "ore-leaching",
    icon = "__angelsrefining__/graphics/technology/chemical-refining.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-floatation"
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-leaching-plant"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore1-crystal"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-crystal"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore3-crystal"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-crystal"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-crystal"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-crystal"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore1-crystal-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-crystal-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore3-crystal-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-crystal-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-crystal-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-crystal-processing"
      },
    },
    unit =
    {
      count = 80,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  {"science-pack-3", 1}
	  },
      time = 30
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "advanced-ore-refining-3",
    icon = "__angelsrefining__/graphics/technology/ore-sorting.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-leaching",
	"advanced-ore-refining-2",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-floatation-cell-3"
      },
	  {
        type = "unlock-recipe",
        recipe = "ore-leaching-plant-2"
      },
	  {
        type = "unlock-recipe",
        recipe = "ore-sorting-facility-4"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crystal"
      },
   	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crystal-mix"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-crystal"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-crystal-processing"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-crystal-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crystal-mix1-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crystal-mix2-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crystal-mix3-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-crystal-mix4-processing"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  {"science-pack-3", 1}
	  },
      time = 15
    },
    order = "c-a"
    },
--TIER 4
    {
    type = "technology",
    name = "ore-refining",
    icon = "__angelsrefining__/graphics/technology/thermal-refining.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-leaching"
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-refinery"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore1-pure"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-pure"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore3-pure"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-pure"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-pure"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-pure"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore1-pure-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore2-pure-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore3-pure-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore4-pure-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore5-pure-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore6-pure-processing"
      },
    },
    unit =
    {
      count = 80,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  {"science-pack-3", 1},
  	  {"alien-science-pack", 1}
	  },
      time = 30
    },
    order = "c-a"
    },
	{
    type = "technology",
    name = "advanced-ore-refining-4",
    icon = "__angelsrefining__/graphics/technology/ore-sorting.png",
	icon_size = 128,
	prerequisites =
    {
	"ore-refining",
	"advanced-ore-refining-3",
    },
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "ore-leaching-plant-3"
      },
	  {
        type = "unlock-recipe",
        recipe = "ore-refinery-2"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-pure"
      },
   	  {
        type = "unlock-recipe",
        recipe = "angelsore7-pure-mix"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-pure"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore7-pure-processing"
      },
  	  {
        type = "unlock-recipe",
        recipe = "angelsore8-pure-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-pure-mix1-processing"
      },
 	  {
        type = "unlock-recipe",
        recipe = "angelsore-pure-mix2-processing"
      },
	  {
        type = "unlock-recipe",
        recipe = "angelsore-pure-mix3-processing"
      },
    },
    unit =
    {
      count = 50,
      ingredients = {
	  {"science-pack-1", 1},
	  {"science-pack-2", 1},
	  {"science-pack-3", 1},
	  {"alien-science-pack", 1}
	  },
      time = 15
    },
    order = "c-a"
    },
}
)