require "settings"

for i=1,maxlevel,1 do
  --the time to scan a sector is controlled by this variable: lower energy = faster scanning
  --the energy decays from 10 to 1 as level increases
  energy=10-9*(SatelliteEquation(i))/SatelliteEquation(maxlevel)
  
  data:extend(
  {
    {
      type = "radar",
      name = "satellite-radar-"..i,
      icon = "__base__/graphics/icons/radar.png",
      flags = {"placeable-player", "player-creation"},
      minable = {hardness = 0.2, mining_time = 0.5, result = "radar"},
      max_health = 150,
      corpse = "big-remnants",
      resistances =
      {
        {
          type = "fire",
          percent = 70
        }
      },
      collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      --the next three lines are the only parameters changed by each level of this mod
      energy_per_sector = energy.."MJ",
      max_distance_of_sector_revealed = math.floor(29/7.*i+14),
      max_distance_of_nearby_sector_revealed = 3+i,
      energy_per_nearby_scan = "250kJ",
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input"
      },
      energy_usage = "300kW",
      pictures =
      {
        filename = "__base__/graphics/entity/radar/radar.png",
        priority = "low",
        width = 153,
        height = 131,
        apply_projection = false,
        direction_count = 64,
        line_length = 8,
        shift = {0.875, -0.34375}
      },
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound = {
          {
            filename = "__base__/sound/radar.ogg"
          }
        },
        apparent_volume = 2,
      }
    }
  })
  data:extend(
  {
    {
      type = "item",
      name = "satellite-radar-"..i,
      icon = "__base__/graphics/icons/radar.png",
      flags = {"goes-to-quickbar"},
      subgroup = "defensive-structure",
      order = "d[radar]-a[radar]",
      place_result = "satellite-radar-"..i,
      stack_size = 50
    }
  })
end