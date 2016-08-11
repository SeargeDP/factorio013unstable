-- debug_status = 1
debug_mod_name = "WaterWell"
debug_file = debug_mod_name .. "-debug.txt"
require("utils")

--------------------------------------------------------------------------------------
function on_configuration_changed(data)
	-- detect any mod or game version change
	if data.mod_changes ~= nil then
		local changes = data.mod_changes[debug_mod_name]
		if changes ~= nil then
			debug_print( "update mod: ", debug_mod_name, " ", tostring(changes.old_version), " to ", tostring(changes.new_version) )
			
			for _,force in pairs(game.forces) do
				force.recipes["water-well-pump"].enabled = force.technologies["steel-processing"].researched
			end
		end
	end
end

script.on_configuration_changed(on_configuration_changed)

