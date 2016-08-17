CURRENT_VERSION = 0.30

function init_global()
  global = global or {}
  global.network = global.network or {}
  global.signals = global.signals or {}
  global.network_version = CURRENT_VERSION
end

function update_global()
  global = global or {}
  global.network = global.network or {}
  global.signals = global.signals or {}
  global.network_version = global.network_version or 0
  if global.network_version < 0.30 then
    -- rebuild network table
    local old_network = global.network
    global.network = {}
    for i,m in pairs(old_network) do
      if m.unit_number then
        -- 0.2.0 table
        add_mast(m)
      else
        -- 0.1.0 table
        add_mast(m.entity)
      end
    end
  end
  global.network_version = CURRENT_VERSION
end

script.on_init(init_global)
script.on_configuration_changed(update_global)

function add_mast(mast)
  table.insert
  (
    global.network,
    {
      id = mast.unit_number,
      entity = mast,
      control = mast.get_or_create_control_behavior(),
      signals = {}
    }
  )
  mast.built_by.print(mast.unit_number .. " added, " .. #global.network .. " total.")
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
  for i,m in pairs(global.network) do
    if m.id == mast.unit_number then
      -- subtract removed mast's inbound signals from global total
      for n,c in pairs(global.network[i].signals) do
        global.signals[n] = (global.signals[n] or 0) - c
      end
      table.remove(global.network, i)
      mast.built_by.print(m.id .. " removed, " .. #global.network .. " total.")
      m = nil
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

function update_mast(index)
  -- subtract this mast's inbound signals for the last update from global total
  for n,c in pairs(global.network[index].signals) do
    global.signals[n] = (global.signals[n] or 0) - c
  end
  -- clear inbound signal count
  global.network[index].signals = {}
  local mc = global.network[index].control
  local cr = mc.get_circuit_network(defines.wire_type.red)
  local cg = mc.get_circuit_network(defines.wire_type.green)
  local np = {parameters={}}
  for i,p in pairs(mc.parameters.parameters) do
    if p.signal.name then
      local r, g = 0, 0
      if cr then
        r = (cr.get_signal(p.signal) or 0) - p.count
      end
      if cg then
        g = (cg.get_signal(p.signal) or 0) - p.count
      end
      -- this mast will output the total inbound signals from all other masts
      p.count = (global.signals[p.signal.name] or 0)
      -- add this mast's inbound signals to total
      global.signals[p.signal.name] = p.count + r + g
      -- store this mast's inbound signals for next update
      global.network[index].signals[p.signal.name] = r + g
      -- count gets stored unsigned, so no negative outputs until this gets patched
      if p.count < 0 then
        p.count = 0
      end
    end
    table.insert(np.parameters, p)
  end
  mc.parameters = np
end

script.on_event(defines.events.on_tick, function(event)
  if #global.network > 0 then
    -- update one mast per tick
    -- hand-wave this away in the fluff as network congestion
    update_mast((event.tick % #global.network) + 1)
  end
end)