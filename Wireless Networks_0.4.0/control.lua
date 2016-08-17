MOD_NAME = "Wireless Networks"
CURRENT_VERSION = "0.4.0"
DEBUG = true

function init_global()
  global = global or {}
  global.network = global.network or {}
  global.signals = global.signals or {}
end

function update_global(changes)
  init_global()
  if changes.mod_changes[MOD_NAME] then
    if changes.mod_changes[MOD_NAME].old_version == "0.2.0" then
      local old_network = global.network
      global.network = {}
      for i,mast in pairs(old_network) do
        add_mast(mast.entity)
      end
    elseif changes.mod_changes[MOD_NAME].old_version == "0.1.0" then
      local old_network = global.network
      global.network = {}
      for i,mast in pairs(old_network) do
        add_mast(mast)
      end
    end
    if DEBUG then
      for i,p in pairs(game.players) do
        p.print("Wireless network updated from " ..
          changes.mod_changes[MOD_NAME].old_version ..
          " to " ..
          changes.mod_changes[MOD_NAME].new_version)
      end
    end
  end
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
  if DEBUG then
    mast.built_by.print("WiFi mast " ..
      mast.unit_number .. " added, " ..
      #global.network .. " total.")
  end
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

function remove_mast(dead_mast)
  for i,mast in pairs(global.network) do
    if mast.id == dead_mast.unit_number then
      -- subtract removed mast's inbound signals from global total
      for name,count in pairs(global.network[i].signals) do
        global.signals[name] = (global.signals[name] or 0) - count
      end
      table.remove(global.network, i)
      if DEBUG then
        dead_mast.built_by.print("WiFi mast " ..
          mast.id .. " removed, " ..
          #global.network .. " remaining.")
      end
      mast = nil
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
  for name,count in pairs(global.network[index].signals) do
    global.signals[name] = (global.signals[name] or 0) - count
  end
  -- clear inbound signal count
  global.network[index].signals = {}
  local red_circuit =
    global.network[index].control.get_circuit_network(defines.wire_type.red)
  local green_circuit =
    global.network[index].control.get_circuit_network(defines.wire_type.green)
  local red_signal, green_signal = 0, 0
  local new_parameters = {parameters={}}
  -- loop over parameters to update emitted signal count
  for i,parameter in pairs(global.network[index].control.parameters.parameters) do
    -- only read valid signals
    if parameter.signal.name then
      -- constant combinators store counts unsigned, make it signed:
      if parameter.count > 2147483647 then
        parameter.count = parameter.count - 4294967296
      end
      -- get count of this signal on red and green wires, excluding this mast's output
      if red_circuit then
        red_signal = (red_circuit.get_signal(parameter.signal) or 0) - parameter.count
      end
      if green_circuit then
        green_signal = (green_circuit.get_signal(parameter.signal) or 0) - parameter.count
      end
      -- this mast will output the total inbound count from all other masts
      parameter.count = (global.signals[parameter.signal.name] or 0)
      -- add this mast's inbound count to total
      global.signals[parameter.signal.name] = parameter.count + red_signal + green_signal
      -- store this mast's inbound count for next update
      global.network[index].signals[parameter.signal.name] = red_signal + green_signal
    end
    table.insert(new_parameters.parameters, parameter)
  end
  global.network[index].control.parameters = new_parameters
end

script.on_event(defines.events.on_tick, function(event)
  if #global.network > 0 then
    -- update one mast per tick
    -- hand-wave this away in the fluff as network congestion
    update_mast((event.tick % #global.network) + 1)
  end
end)