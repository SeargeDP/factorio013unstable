mast = util.table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
mast.name = "wireless-mast"
mast.icon = "__Wireless Networks__/graphics/icons/wireless-mast.png"
mast.minable.result = "wireless-mast"
mast.collision_box = {{-0.15, -0.15}, {0.15, 0.15}}
mast.item_slot_count = 5
mast.sprites = 
{
  north =
  {
    filename = "__Wireless Networks__/graphics/entity/wireless-mast/wireless-mast.png",
    width = 140,
    height = 140,
    frame_count = 1,
    shift = {1.125, -1.125},
  }
}
mast.sprites.east = mast.sprites.north
mast.sprites.south = mast.sprites.north
mast.sprites.west = mast.sprites.north
mast_activity_sprite =
{
  filename = "__base__/graphics/entity/combinator/activity-leds/combinator-led-arithmetic-west.png",
  width = 13,
  height = 11,
  frame_count = 1
}
mast.activity_led_sprites =
{
  north = mast_activity_sprite,
  east = mast_activity_sprite,
  south = mast_activity_sprite,
  west = mast_activity_sprite
}
-- mast.activity_led_light = nil
mast.activity_led_light_offsets =
{
  {0, 0},
  {0, 0},
  {0, 0},
  {0, 0}
}
mast_wire_points =
{
  shadow =
  {
    red = {0.8125, 0.1875},
    green = {0.8125, 0.1875},
  },
  wire =
  {
    red = {0.25, 0.-0.125},
    green = {0.25, 0.03125},
  }
}
mast.circuit_wire_connection_points =
{
  mast_wire_points,
  mast_wire_points,
  mast_wire_points,
  mast_wire_points
}

data:extend({
  mast
})