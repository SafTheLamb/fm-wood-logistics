local red_science_costs_basic_gears =
  settings.startup["wood-logistics-red-science-item"].value == "basic-gear-wheel"
  and settings.startup["wood-logistics-red-science-cost"].value > 0
if settings.startup["wood-logistics-belts"].value == "item" or red_science_costs_basic_gears then
  data:extend({
    {
      type = "recipe",
      name = "basic-gear-wheel",
      normal = {
        ingredients = {{"wood", 1}, {"copper-plate", 1}},
        result = "basic-gear-wheel"
      },
      expensive = {
        ingredients = {{"wood", 2}, {"copper-plate", 2}},
        result = "basic-gear-wheel"
      }
    }
  })
end

if settings.startup["wood-logistics-belts"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "wood-transport-belt",
      ingredients = {{"wood", 1}, {"basic-gear-wheel", 1}},
      result = "wood-transport-belt",
      result_count = 2
    },
    {
      type = "recipe",
      name = "wood-underground-belt",
      enabled = false,
      energy_required = 1,
      ingredients = {{"wood", 6}, {"wood-transport-belt", 4}},
      result = "wood-underground-belt",
      result_count = 2
    },
    {
      type = "recipe",
      name = "wood-splitter",
      enabled = false,
      energy_required = 1,
      ingredients = {{"copper-cable", 5}, {"wood", 5}, {"wood-transport-belt", 2}},
      result = "wood-splitter"
    }
  })
end

if settings.startup["wood-logistics-big-electric-pole"].value == "item" then
  data:extend({
    {
      type = "recipe",
      name = "big-wood-electric-pole",
      enabled = false,
      ingredients = {
        {"wood", 8},
        {"steel-plate", 1},
        {"copper-cable", 5}
      },
      result = "big-wood-electric-pole"
    }
  })
end
