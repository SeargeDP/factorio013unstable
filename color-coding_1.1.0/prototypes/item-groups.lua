data:extend({
    {
        -- create new inventory tab and set icon
        type = "item-group",
        name = "color-mod",
        order = "z",
        inventory_order = "z",
        icon = MOD_NAME.."/graphics/color-coding.png"
    },
    {
        -- row for colored indicator lamps
        type = "item-subgroup",
        name = "color-lamps",
        group = "color-mod",
        order = "l",
    },
    {
        -- row for colored trains
        type = "item-subgroup",
        name = "color-trains",
        group = "color-mod",
        order = "t",
    },
    {
        -- row for colored concretes
        type = "item-subgroup",
        name = "color-concrete",
        group = "color-mod",
        order = "x",
    }
})
