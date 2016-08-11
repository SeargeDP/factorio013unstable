--debug_status = 1
debug_mod_name = "DrillingPumpjack"
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
				force.recipes["drilling-pumpjack"].enabled = force.technologies["advanced-oil-extraction"].researched
				force.recipes["drilling-pumpjack-mk2"].enabled = force.technologies["advanced-oil-extraction-mk2"].researched
				force.recipes["drilling-pumpjack-mk3"].enabled = force.technologies["advanced-oil-extraction-mk3"].researched
			end
		end
	end
end

script.on_configuration_changed(on_configuration_changed)

