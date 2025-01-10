for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods

  if settings.startup["wood-logistics-cargo-wagon"].value then
    recipes["wood-cargo-wagon"].enabled = technologies["railway"].researched
    if mods["space-age"] then
      recipes["cargo-wagon"].enabled = technologies["tungsten-steel"].researched
    end
  end
end
