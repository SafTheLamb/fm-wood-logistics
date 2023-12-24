local modutil = require("modutil")

if settings.startup["wood-logistics-belts"].value == "item" then
  data:extend({
    {
      type = "technology",
      name = "wood-logistics",
      icon = "__wood-logistics__/graphics/technology/wood-logistics.png",
      icon_size = 256, icon_mipmaps = 4,
      effects = {
        {type="unlock-recipe", recipe="wood-underground-belt"},
        {type="unlock-recipe", recipe="wood-splitter"}
      },
      unit = {
        count = 10,
        ingredients = {{"automation-science-pack", 1}},
        time = 10
      },
      order = "a-f-A"
    }
  })
end

if settings.startup["wood-logistics-big-electric-pole"].value == "item" then
  data:extend({
    {
      type = "technology",
      name = "wood-electric-energy-distribution",
      icon = "__wood-logistics__/graphics/technology/wood-electric-energy-distribution.png",
      icon_size = 256, icon_mipmaps = 4,
      effects = {
        {type = "unlock-recipe", recipe="big-wood-electric-pole"},
      },
      prerequisites = {"steel-processing"},
      unit = {
        count = 50,
        ingredients = {{"automation-science-pack", 1}},
        time = 10
      },
      order = "a"
    }
  })

  if modutil.aai_industry then
    table.insert(data.raw.technology["wood-electric-energy-distribution"].prerequisites, "electricity")
  end
end
