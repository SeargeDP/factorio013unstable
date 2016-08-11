data:extend({

  {
    type= "item",
    name= "algae",
    icon= "__Algaculture__/graphics/icons/algae.png",
    flags= { "goes-to-main-inventory" },
    subgroup= "raw-material",
    order= "a-b-c",
    stack_size= 50
  },
  
    {
    type = "capsule",
    name = "nutrient-paste",
    icon = "__Algaculture__/graphics/icons/nutrient-paste.png",
    flags = {"goes-to-quickbar"},
    subgroup = "raw-material",
    capsule_action =
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = {type = "physical", amount = -50}
              }
            }
          }
        }
      }
    },
    stack_size = 100
    }
  
})
  
