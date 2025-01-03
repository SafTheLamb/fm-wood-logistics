for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  if settings.startup["wood-logistics-cargo-wagon"].value then
    recipes["wood-cargo-wagon"].enabled = technologies["railway"].researched
    if script.active_mods["space-age"] then
      recipes["cargo-wagon"].enabled = technologies["tungsten-steel"].researched
    end
  end
end
