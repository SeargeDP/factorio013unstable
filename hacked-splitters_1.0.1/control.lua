require "math"
require ".debug"


-- For configuration changes.
local modname = "hacked-splitters"

-- A little state machine indicating the order of transport
-- lines--both input and output--to check based on the last line
-- checked.
local transport_line = defines.transport_line
local transport_fsm = {
   -- Input lines.
   [ transport_line.left_line ] = transport_line.secondary_left_line,
   [ transport_line.secondary_left_line ] = transport_line.right_line,
   [ transport_line.right_line ] = transport_line.secondary_right_line,
   [ transport_line.secondary_right_line ] = transport_line.left_line,

   -- Output lines.
   [ transport_line.left_split_line ] = transport_line.secondary_left_split_line,
   [ transport_line.secondary_left_split_line ] = transport_line.right_split_line,
   [ transport_line.right_split_line ] = transport_line.secondary_right_split_line,
   [ transport_line.secondary_right_split_line ] = transport_line.left_split_line
}

-- Belts for the splitters, used to determine how frequently to check
-- for items.
local hacked_splitter_belts = {
   ours = {
      ["hacked-splitter"] = "transport-belt",
      ["hacked-fast-splitter"] = "fast-transport-belt",
      ["hacked-express-splitter"] = "express-transport-belt"
   },

   -- TODO: Third-party mods can register their hacked splitters and the
   --       associated belt speeds (see `remote` API). Be sure to check
   --       for `nil` or 0 speeds (NaN maths). This may need to be
   --       stored in `global` for multiplayer...?
   third_party = {}
}


script.on_init (function() initialize() end)
script.on_configuration_changed (
   function (data)
      local changes = data.mod_changes

      if changes then
         dprint ('CONFIG:', table.tostring (changes))
      end

      if changes and changes[modname] then
         local mod = changes[modname]
         if mod.old_version == nil then
            -- It's being added. Create skeleton data structures.
            initialize()
         elseif mod.old_version ~= mod.new_version then
            -- Migration not covered in `migrations/*.lua'
            print (modname, "migration", mod.old_version, mod.new_version)

            -- Until one of major.minor.micro exceeds "9", we can
            -- lexigraphically compare.
            if mod.old_version < "1.0.0" then
               -- Beta versions are wiped. Hacked splitters will
               -- need to be replaced in the world.
               print (modname, "migrating", "old < 1.0.0")
               initialize()
            end

            if mod.new_version <= "1.0.1" then
               print (modname, "migrating", "new <= 1.0.1")
               global.belt_cache = build_belt_cache()
            end
         end
         dprint ('CONFIG:', table.tostring (global))
      end
   end
)


script.on_event (
   defines.events.on_player_created,
   function (event)
      if debug.enabled then
         dprint (event.tick, "DEBUG:", "enabled")
         local player = game.players[event.player_index]
         debug.create_items (player)
         player.force.research_all_technologies()
         game.surfaces[1].always_day = true
      end
   end
)


script.on_event (
   defines.events.on_tick,
   function (event)
      process_splitters (event.tick)
   end
)


script.on_event (
   {
      defines.events.on_built_entity,
      defines.events.on_robot_built_entity
   },
   function (event)
      local entity = event.created_entity
      if is_splitter (entity) then
         -- Now we'll do the same-ol' creation logic for all of our
         -- splitters irrespective (that's not a word!!) of type.
         local key = poskey (entity)

         dprint (event.tick, "BUILT:", key, entity.name)
         local freq = global.belt_cache[entity.name]
         global.splitters[freq] = global.splitters[freq] or {}
         global.splitters[freq][key] = create_splitter (entity)
      end
   end
)


script.on_event (
   {
      defines.events.on_entity_died,
      defines.events.on_preplayer_mined_item,
      defines.events.on_robot_pre_mined
   },
   function (event)
      local entity = event.entity
      if is_splitter (entity) then
         local key = poskey (entity)

         dprint (event.tick, "MINED:", key, entity.name)
         local freq = global.belt_cache[entity.name]
         global.splitters[freq] = global.splitters[freq] or {}
         global.splitters[freq][key] = nil
      end
   end
)


function initialize()
   -- The hacked splitters that have been placed in the world.
   global.splitters = {}

   -- The splitters use this table to determine how many ticks it
   -- takes from when it enters a splitter's input to when it enters
   -- the output. This is also used to determine what splitters are
   -- hacked.
   global.belt_cache = build_belt_cache()
end


function create_splitter (entity)
   --[[--
      The state data for a splitter. The fields are:
        input   - last inbound line that had an item removed
        output  - last outbound line that hand an item placed
        entity  - the hacked splitter game object
   --]]--
   local splitter = {
      input=transport_line.left_line,
      output=transport_line.left_split_line,
      entity=entity
   }
   return splitter
end


function poskey (entity)
   -- Create our own location index into the `splitters` table.  It
   -- requires the surface since multiple surfaces can have the same
   -- position coordinates.
   local name = entity.surface.name
   local pos = entity.position

   return name .. ":" .. tostring (pos.x) .. ":" .. tostring (pos.y)
end


function transport_iter (initial)
   -- A special property of this iterator is that it will iterate
   -- through all lines on a side of the splitter, once.
   local transport_fsm = transport_fsm
   local curr = nil
   return function()
      if curr ~= initial then
         curr = curr or initial
         curr = transport_fsm[curr]
         return curr
      end
   end
end


function first (t)
   -- Simple routine to give only the first item
   -- found in a table.
   for k, v in pairs (t) do return k, v end
end


function process_splitter (tick, splitter)
   local first = first
   local belt_cache = global.belt_cache
   local entity = splitter.entity

   -- We create the iterator here because the number of outbound lanes
   -- is finite. There's no point in looping on all of them for each
   -- inbound lane.
   local output_iter = transport_iter (splitter.output)

   for input in transport_iter (splitter.input) do
      -- The hack to the splitter created a bit of the Schrodinger
      -- Splitter--you really can't tell which item on the
      -- transport line will come out first.
      local tin = entity.get_transport_line (input)
      local item, count = first (tin.get_contents())

      if item then
         local success = false
         for output in output_iter do
            -- Here's the actual act. Everything else was foreplay.
            local tout = entity.get_transport_line (output)

            -- Can't use `insert_at_back`. It will not compress the belts.
            if tout.insert_at (0, {name=item}) then
               tin.remove_item ({name=item})

               -- Update the last lines that were successfully used.
               splitter.input = input
               splitter.output = output
               success = true
               break
            end
         end

         -- If we fail to insert, it's not the end of the world.  To
         -- keep a compressed belt, the default splitter logic will
         -- take over. This happens when an outbound belt is
         -- completely stopped.
         if not success then
            dprint (tick, "defaulting to standard splitter logic")
         end
      end
   end
end


function process_splitters (tick)
   for freq, splitters in pairs (global.splitters) do
      if tick % freq == 0 then
         for key, splitter in pairs (splitters) do
            process_splitter (tick, splitter)
         end
      end
   end
end


function is_splitter (entity)
   -- Or more specifically, a hacked splitter.
   if entity.type ~= "splitter" then
      return false
   else
      return global.belt_cache[entity.name] ~= nil
   end
end


function calc_belt_ticks (belt)
   --[[--
      To my knowledge, you can't interrogate the recipes at this point
      nor can you access the `.speed` field of the splitter prototype
      since it isn't exposed. Instead, we *assume* the proper speed is
      paired with a belt type.

      The time an item is spent in the splitter unit appears to be:
        calc_time = 1 / speed
          ; basic=32, fast=16, express=10.667
        actual_time = math.floor (calc_time)
          ; basic=32, fast=16, express=10

      This means an express splitter is faster than an express belt by
      a whopping 6.67%!

      The above was observed by creating four sets of four alternating
      items on one line of vanilla splitter behavior, querying each
      line every tick. For the express splitter, as an example, you
      see 6 ticks on the inbound side (line = 1) and 4 ticks on the
      outbound side (line = 5). Here's data for a bunch of speeds:

        speed                in/out   calc_time
        0.140625              4/2     7.111111111111111
        0.11249999999999999   5/3     8.88888888888889
        0.09375               6/4    10.666666666666666  ; express
        0.08035714285714285   6/5    12.444444444444446
        0.0703125             7/6    14.222222222222221
        0.0625                8/7    16.0                ; fast
        0.056249999999999994  9/7    17.77777777777778
        0.05113636363636363  10/9    19.555555555555557
        0.046875             11/9    21.333333333333332
        0.04326923076923077  12/10   23.11111111111111
        0.03125              16/15   32.0                ; basic

      We have to make a decision to balance the item before it
      transitions to the output line automatically--i.e., before the
      default splitter logic makes the decision for us. So, how do we
      determine this programmatically?

      Seemingly, a generalized formula tht fits this data is:

        inbound = math.floor (calc_time / 2 + 0.75)

      Given a fixed point on the belt, we know how many ticks it takes
      for an item to pass by that point. We use the unit distance to
      calculate this. As of Factorio 0.13.3, this is 0.28125 units.

        tick_interval = 0.28125 / speed
          ; basic=9, fast=4.5, express=3

      However, in-game with the fast splitter, the ticks between when
      an item enters the inbound-side and the next item is 4. Likewise
      for when it enters the outbound-side. Cautiously, I'll say the
      tick interval for the first item on inbound and outbound is:

         tick_interval = math.floor (0.28125 / speed)

   --]]--

   local inbound = nil
   local entity = game.entity_prototypes[belt]
   if entity and entity.type == "transport-belt" then
      local calc_time = 1 / entity.belt_speed
      inbound = math.floor (calc_time / 2 * 0.75)
      -- inbound = math.floor (0.28125 / entity.belt_speed)
   end

   return inbound
end


function build_belt_cache()
   -- Process the third-party first so that we overwrite any bad-actors
   -- that use our hacked splitter namespace.
   local belt_cache = {}

   for splitter, belt in pairs (hacked_splitter_belts.third_party) do
      local ticks = calc_belt_ticks (belt)
      if ticks ~= nil then
         belt_cache[splitter] = ticks
      end
   end

   for splitter, belt in pairs (hacked_splitter_belts.ours) do
      local ticks = calc_belt_ticks (belt)
      if ticks ~= nil then
         belt_cache[splitter] = ticks
      end
   end

   dprint ("BELT_CACHE:", table.tostring (belt_cache))
   return belt_cache
end
