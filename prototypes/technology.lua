-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  if mods["aai-industry"] then
    data:extend({
      {
        type = "technology",
        name = "basic-wood-logistics",
        icon = "__wood-logistics__/graphics/technology/wood-logistics.png",
        icon_size = 256, icon_mipmaps = 4,
        effects = {
          {type="unlock-recipe", recipe="wood-transport-belt"},
          {type="unlock-recipe", recipe="copper-cable"},
        },
        research_trigger = {
          type = "craft-item",
          item = "copper-cable",
          count = 50,
        },
      }
    })
  end
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
      prerequisites = {"automation-science-pack"},
      unit = {
        count = 10,
        ingredients = {{"automation-science-pack", 1}},
        time = 10
      },
      order = "a-f-A"
    }
  })
end

-------------------------------------------------------------------------- Lumber mill

if settings.startup["wood-logistics-lumber-mill"].value then
  data:extend({
    {
      type = "technology",
      name = "advanced-carpentry",
      icon = "__wood-logistics__/graphics/technology/lumber-mill.png",
      icon_size = 256, icon_mipmaps = 4,
      effects = {{type="unlock-recipe", recipe="lumber-mill"}},
      prerequisites = {"automation-3"},
      unit = {
        count = 250,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
        },
        time = 60
      }
    },
  })
end

-------------------------------------------------------------------------- Electric poles

if settings.startup["wood-logistics-big-electric-pole"].value then
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
end
