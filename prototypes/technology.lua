if settings.startup["wood-logistics-belts"].value == "item" then
  data:extend({
    {
      type = "technology",
      name = "wood-logistics",
      icon = "__wood-logistics__/graphics/technology/wood-logistics.png",
      icon_size = 256, icon_mipmaps = 4,
      effects = {
        {type = "unlock-recipe", recipe = "wood-underground-belt"},
        {type = "unlock-recipe", recipe = "wood-splitter"}
      },
      unit = {
        count = 10,
        ingredients = {{"automation-science-pack", 1}},
        time = 10
      },
      order = "a-f-a"
    }
  })
end
