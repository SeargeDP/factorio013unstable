require "settings"

function CalculateLevel(a)
  satellites=0
  if game.players[1].gui.left.rocket_score==nil then
    satellites=0
  elseif tonumber(game.players[1].gui.left.rocket_score.rocket_count.caption)>=0 then
    satellites=tonumber(game.players[1].gui.left.rocket_score.rocket_count.caption)
  end
  satellites=satellites+a
  level=LevelEquation(satellites)
  if level<=0 then
    return 0
  elseif level>=maxlevel then
    return maxlevel
  else
    return level
  end
end

function ReplaceAllRadars(event)
  if event.rocket.get_item_count("satellite") > 0 then
    oldlevel=CalculateLevel(-1)
    level=CalculateLevel(0)
    if (level>oldlevel or global.replaceradars) and level>0 then
      global.replaceradars=false
      for k, f in pairs (game.forces) do
        for k, s in pairs (game.surfaces) do
          for c in s.get_chunks() do
            for key, b in pairs(s.find_entities_filtered({area={{c.x * 32, c.y * 32}, {c.x * 32 + 32, c.y * 32 + 32}}, type = "radar"})) do
              if string.find(b.name,'satellite%-radar%-') or b.name=="radar" then
                if b.force == f then
                  local p = b.position
                  b.destroy()
                  s.create_entity{name = "satellite-radar-"..level, position = p, force = f}
                end   
              end    
            end
          end
        end
      end
    end
  end
end

script.on_configuration_changed(function(data)
  if data.mod_changes ~= nil and data.mod_changes["SatelliteRadar"] ~= nil and data.mod_changes["SatelliteRadar"].old_version == nil then
    global.replaceradars=true
  end
end)

script.on_event(defines.events.on_rocket_launched, ReplaceAllRadars)  

function BuiltEntity(event)
  local e = event.created_entity
  if e.type=="entity-ghost" then
    if string.find(e.ghost_name,'satellite%-radar%-') then
      local s = e.surface
      local p = e.position
      local f = e.force
      local d = e.direction
      e.destroy()
      s.create_entity{name = "entity-ghost", position = p, inner_name = "radar", force = f, direction = d}
    end
  elseif e.type=="radar" and e.name=="radar" then   
    local s = e.surface
    local p = e.position
    local f = e.force
    local d = e.direction
    level=CalculateLevel(0)
    if level>0 then
      e.destroy()
      s.create_entity{name = "satellite-radar-"..level, position = p, force = f, direction = d}
    end
  end
end

script.on_event(defines.events.on_entity_died, function(event)
  local e = event.entity
  local X = e.position.x
  local Y = e.position.y
  local s = e.surface
  if e.type=="radar" and string.find(e.name,'satellite%-radar%-') then
    local ghost = s.find_entities_filtered({area={{X-0.5,Y-0.5},{X+0.5,Y+0.5}}, type = "entity-ghost"})
    if ghost[1]~= nil then
      ghost[1].destroy()
    end
    s.create_entity{name = "entity-ghost", position = {X,Y}, inner_name = "radar", force = e.force}
  end
end)
 
script.on_event(defines.events.on_built_entity, BuiltEntity)
script.on_event(defines.events.on_robot_built_entity, BuiltEntity)