for index, force in pairs(game.forces) do
   local technologies = force.technologies;
   local recipes = force.recipes;

   if technologies["logistics"].researched then
      recipes["hacked-splitter"].enabled = true
   end
   if technologies["logistics-2"].researched then
      recipes["hacked-fast-splitter"].enabled = true
   end
   if technologies["logistics-3"].researched then
      recipes["hacked-express-splitter"].enabled = true
   end
end
