for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  if settings.startup["wood-logistics-cargo-wagon"].value then
    recipes["wood-cargo-wagon"].enabled = technologies["railway"].researched
    if script.active_mods["space-age"] then
      recipes["cargo-wagon"].enabled = technologies["tungsten-steel"].researched
    end
  end

  -- hacky compat fix
  if script.active_mods["apm_power_ldinc"] then
    if script.active_mods["aai-industry"] then
      technologies["basic-wood-logistics"].researched = recipes["wood-splitter"].enabled
    else
      recipes["wood-underground-belt"].enabled = true
      recipes["wood-splitter"].enabled = true
    end
  end
end
