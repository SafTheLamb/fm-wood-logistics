if mods["aai-loaders"] and settings.startup["wood-logistics-belts"].value then
  AAILoaders.make_tier{
    name = "wood",
    transport_belt = "wood-transport-belt",
    color = {160, 110, 90},
    fluid = "steam",
    fluid_per_minute = 7.5,
    fluid_technology_prerequisites = mods["aai-industry"] and {"steam-power"} or nil,
    technology = {
      unit = {
        count = mods["aai-industry"] and 50 or 25,
        ingredients = mods["aai-industry"] and {{"automation-science-pack", 1}, {"logistic-science-pack", 1}} or {{"automation-science-pack", 1}},
        time = 15
      },
      prerequisites = {"wood-logistics"}
    },
    recipe = {
      ingredients = {
        {type = "item", name = "wood-transport-belt", amount = 1},
        {type = "item", name = "basic-gear-wheel", amount = 5},
        {type = "item", name = "copper-cable", amount = 10}
      },
      energy_required = 1
    },
    unlubricated_recipe = {
      ingredients = {
        {type = "item", name = "wood-transport-belt", amount = 1},
        {type = "item", name = "basic-gear-wheel", amount = 50},
        {type = "item", name = "copper-cable", amount = 100}
      },
      energy_required = 5
    },
    next_upgrade = "aai-loader",
    localise = false
  }
end
