data:extend({
  {
    type = "item",
    name = "pollution-detector",
    icon = "__pollution-detector__/graphics/icons/pollution-detector.png",
    flags = { "goes-to-quickbar" },
    subgroup = "circuit-network",
    place_result="pollution-detector",
    order = "b[combinators]-c[pollution-detector]",
    stack_size= 50,
  },
  {
    type = "capsule",
    name = "pollution",
    icon = "__pollution-detector__/graphics/icons/pollution.png",
    flags = { "goes-to-main-inventory" },
    subgroup = "raw-resource",
    order = "g[plastic-bar]-h[pollution]",
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            type = "direct",
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "damage",
                damage = {type = "physical", amount = 20}
              }
            }
          }
        }
      }
    },
    stack_size= 1000,
  }
})
