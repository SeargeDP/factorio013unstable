local modname = "__hacked-splitters__"

-- The hacked variants of the splitters share all of the
-- characteristics of their baser counterparts. Instead of
-- copy-pasting the entity data that is subject to change, we'll
-- procedurally build the hacked splitters, updating the entity name
-- and paths to the assets.

for i, name in ipairs ({"splitter", "fast-splitter", "express-splitter"}) do
   local hacked = "hacked-"..name

   local template = util.table.deepcopy (data.raw["splitter"][name])
   template.name = hacked
   template.minable.result = hacked
   template.icon = modname.."/graphics/icons/"..hacked..".png"

   local fmt = modname.."/graphics/entity/"..hacked.."/"..hacked.."-%s.png"
   template.structure.north.filename = string.format (fmt, "north")
   template.structure.east.filename = string.format (fmt, "east")
   template.structure.south.filename = string.format (fmt, "south")
   template.structure.west.filename = string.format (fmt, "west")

   data:extend({template})
end
