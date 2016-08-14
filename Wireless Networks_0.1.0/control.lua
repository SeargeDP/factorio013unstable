function init_global()
  global = global or {}
  global.network = global.network or {}
end

script.on_configuration_changed(init_global)
script.on_init(init_global)

function add_mast(entity)
  table.insert(global.network, entity)
  -- entity.built_by.print("Added "..entity.unit_number.." to network.")
end

script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == "wireless-mast" then
    add_mast(event.created_entity)
  end
end)
script.on_event(defines.events.on_robot_built_entity, function(event)
  if event.created_entity.name == "wireless-mast" then
    add_mast(event.created_entity)
  end
end)

function remove_mast(entity)
  for i,m in pairs(global.network) do
    if m == entity then
      global.network[i] = nil
      -- entity.built_by.print("Removed "..entity.unit_number.." from network.")
    end
  end
end

script.on_event(defines.events.on_preplayer_mined_item, function(event)
  if event.entity.name == "wireless-mast" then
    remove_mast(event.entity)
  end
end)
script.on_event(defines.events.on_robot_pre_mined, function(event)
  if event.entity.name == "wireless-mast" then
    remove_mast(event.entity)
  end
end)
script.on_event(defines.events.on_entity_died, function(event)
  if event.entity.name == "wireless-mast" then
    remove_mast(event.entity)
  end
end)

script.on_event(defines.events.on_tick, function(event)
  if event.tick % 30 == 3 then
    local cb = {}
    local cr = {}
    local cg = {}
    local sa = {}
    local x = 0
    for i,m in pairs(global.network) do
      if m.valid then
        cb = m.get_control_behavior()
        -- m.built_by.print(cb.type)
        if cb then
          cr = cb.get_circuit_network(defines.wire_type.red)
          cg = cb.get_circuit_network(defines.wire_type.green)
          for k,p in pairs(cb.parameters.parameters) do
            if p.signal.name then
            -- if cr and cr.valid then
              sa[p.signal.name] = sa[p.signal.name] or 0
              if cr then
                sa[p.signal.name] = sa[p.signal.name] + cr.get_signal(p.signal) - p.count
              end
              if cg then
                sa[p.signal.name] = sa[p.signal.name] + cg.get_signal(p.signal) - p.count
              end
            end
          end
        end
      end
    end
    for i,m in pairs(global.network) do
      cb = m.get_control_behavior()
      local np = {parameters={}}
      if cb then
        cr = cb.get_circuit_network(defines.wire_type.red)
        cg = cb.get_circuit_network(defines.wire_type.green)
        for k,p in pairs(cb.parameters.parameters) do
          local r, g = 0, 0
          if p.signal.name then
            if cr then
              r = (cr.get_signal(p.signal) or 0) - p.count
            end
            if cg then
              g = (cg.get_signal(p.signal) or 0) - p.count
            end
            -- m.built_by.print(sa[p.signal.name] .. ", " .. r .. ", " .. g .. ", " .. m.unit_number)
            -- p.count = s - r - g
            p.count = sa[p.signal.name] - r - g
          end
          table.insert(np.parameters, p)
        end
        cb.parameters=np
      end
    end
  end
end)