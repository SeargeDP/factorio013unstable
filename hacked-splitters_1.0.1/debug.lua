debug = {}
debug.enabled = false


function debug.create_items (player)
   player.character.insert{name="hacked-splitter", count=50}
   player.character.insert{name="hacked-fast-splitter", count=50}
   player.character.insert{name="hacked-express-splitter", count=50}

   player.character.insert{name="transport-belt", count=200}
   player.character.insert{name="fast-transport-belt", count=200}
   player.character.insert{name="express-transport-belt", count=200}

   player.character.insert{name="splitter", count=50}
   player.character.insert{name="fast-splitter", count=50}
   player.character.insert{name="express-splitter", count=50}

   player.character.insert{name="express-underground-belt", count=50}

   player.character.insert{name="raw-wood", count=50}
   player.character.insert{name="iron-plate", count=1000}
   player.character.insert{name="copper-plate", count=1000}

   player.character.insert{name="fast-inserter", count=50}
   player.character.insert{name="stack-inserter", count=50}
   player.character.insert{name="constant-combinator", count=10}
   player.character.insert{name="red-wire", count=100}

   player.character.insert{name="solar-panel", count=50}
   player.character.insert{name="small-electric-pole", count=50}
   player.character.insert{name="iron-chest", count=50}
end


if debug.enabled then
   dprint = print
else
   dprint = function(...) end
end


-- Courtesy of http://lua-users.org/wiki/TableUtils

function table.val_to_str ( v )
   if "string" == type( v ) then
      v = string.gsub( v, "\n", "\\n" )
      if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
         return "'" .. v .. "'"
      end
      return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
   else
      return "table" == type( v ) and table.tostring( v ) or
         tostring( v )
   end
end


function table.key_to_str ( k )
   if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
      return k
   else
      return "[" .. table.val_to_str( k ) .. "]"
   end
end


function table.tostring( tbl )
   local result, done = {}, {}

   if not tbl then
      if type(tbl) == "table" then return "{}"
      else return "nil"
      end
   end

   for k, v in ipairs( tbl ) do
      table.insert( result, table.val_to_str( v ) )
      done[ k ] = true
   end
   for k, v in pairs( tbl ) do
      if not done[ k ] then
         table.insert( result,
                       table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
      end
   end
   return "{" .. table.concat( result, "," ) .. "}"
end


return debug
