local pollution_detectors = {}
local ticks = 61

-- Events
script.on_event(defines.events.on_built_entity, function(event)
  if (event.created_entity.name == "pollution-detector") then
    disableOperableIfPD(event.created_entity)
    addPDToTable(event.created_entity)
  end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  if (event.created_entity.name == "pollution-detector") then
    disableOperableIfPD(event.created_entity)
    addPDToTable(event.created_entity)
  end
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
  removePollutionDetector(event.entity)
end)

script.on_event(defines.events.on_robot_pre_mined, function(event)
  removePollutionDetector(event.entity)
end)

script.on_event(defines.events.on_entity_died, function(event)
  removePollutionDetector(event.entity)
end)

script.on_event(defines.events.on_tick, function(event)
  ticks = ticks + 1
  if ticks >= 60 then
    ticks = 0
    for i, pollution_detector in ipairs(pollution_detectors) do
     setPollutionValue(pollution_detector)
   end   
  end
end)

script.on_init(function()
  onLoad()
end)

script.on_load(function()
  onLoad()
end)

function onLoad()
  if not global.pollutionDetectors then
    global.pollutionDetectors = {}
  end

  pollution_detectors = global.pollutionDetectors
end

-- Logic

function disableOperableIfPD(entity)
  entity.operable = false
end

function addPDToTable(entity)
  table.insert(pollution_detectors, entity)
end

function removePollutionDetector(entity)
  for i, pollution_detector in ipairs(pollution_detectors) do
    if notNil(pollution_detector, "position") then
      if pollution_detector.position.x == entity.position.x and pollution_detector.position.y == entity.position.y then
        table.remove(pollution_detectors,i)
        break
      end
    end
  end
end

function notNil(class, var)
  value = false
  pcall(function()
    if class[var] then
      value = true
    end
  end)
  return value
end

function setPollutionValue(entity)
  pollution_count = math.floor(game.surfaces['nauvis'].get_pollution({entity.position.x,entity.position.y}))
  params = {parameters={
    {index=1,signal={type="item",name="pollution"},count=pollution_count}
  }}

  entity.get_control_behavior().parameters = params
end