data:extend({

  {
    type = "fluid",
    name = "fertilizer",
    default_temperature = 25,
    base_color = {r=0.85, g=0.85, b=0.5},
    flow_color = {r=1, g=1, b=0.75},
    heat_capacity = "1KJ",
    max_temperature = 100,
    icon = "__Algaculture__/graphics/icons/fluid/fertilizer.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "g[fertilizer]"
  },
  
  {
    type = "fluid",
    name = "biodiesel",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0.75, g=1, b=0},
    flow_color = {r=0.85, g=1, b=0.1},
    max_temperature = 100,
    icon = "__Algaculture__/graphics/icons/fluid/biodiesel.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "h[biodiesel]"
  }
})
