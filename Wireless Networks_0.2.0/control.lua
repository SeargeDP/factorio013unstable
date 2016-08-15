CURRENT_VERSION = 0.20

function init_global()
  global = global or {}
  global.network = global.network or {}
  global.network_version = CURRENT_VERSION
end

function update_global()
  global = global or {}
  global.network = global.network or {}
  global.network_version = global.network_version or 0
  -- Rebuild 0.1.0 network to use new format
  if global.network_version < 0.20 then
    local old_network = global.network
    global.network = {}
    for i,m in pairs(old_network) do
      add_mast(m)
    end
    for i,p in pairs(game.players) do
      p.print("Wireless network updated.")
    end
  end
  global.network_version = CURRENT_VERSION
end

script.on_init(init_global)
script.on_configuration_changed(update_global)

function add_mast(mast)
  global.network[mast.unit_number] =
  {
    entity = mast,
    control = mast.get_or_create_control_behavior()
  }
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

function remove_mast(mast)
  global.network[mast.unit_number] = nil
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
  -- if event.tick % 30 == 3 then
    local sa = {}
    for i,m in pairs(global.network) do
      if not m.control.valid then
        m.control = m.get_or_create_control_behavior()
      end
      local cr = m.control.get_circuit_network(defines.wire_type.red)
      local cg = m.control.get_circuit_network(defines.wire_type.green)
      for k,p in pairs(m.control.parameters.parameters) do
        if p.signal.name then
          local sr, sg = 0, 0
          if cr then
            sr = cr.get_signal(p.signal) - p.count
          end
          if cg then
            sg = cg.get_signal(p.signal) - p.count
          end
          sa[p.signal.name] = (sa[p.signal.name] or 0) + sr + sg
        end
      end
    end
    for i,m in pairs(global.network) do
      local np = {parameters={}}
      local cr = m.control.get_circuit_network(defines.wire_type.red)
      local cg = m.control.get_circuit_network(defines.wire_type.green)
      for k,p in pairs(m.control.parameters.parameters) do
        if p.signal.name then
          local sr, sg = 0, 0
          if cr then
            sr = (cr.get_signal(p.signal) or 0) - p.count
          end
          if cg then
            sg = (cg.get_signal(p.signal) or 0) - p.count
          end
          p.count = sa[p.signal.name] - sr - sg
          -- count currently saves as unsigned int, this is bad
          -- disable negative output until this bug is fixed
          if p.count < 0 then
            p.count = 0
          end
        end
        table.insert(np.parameters, p)
      end
      m.control.parameters = np
    end
  -- end
end)