if data.raw.item["basic-gear-wheel"] then
  data:extend({
    {
      type = "recipe",
      name = "basic-gear-wheel",
      ingredients = {
        {type="item", name="wood", amount=1},
        {type="item", name="copper-plate", amount=1}
      },
      results = {{type="item", name="basic-gear-wheel", amount=1}}
    }
  })
end

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "recipe",
      name = "wood-transport-belt",
      enabled = not mods["aai-industry"],
      ingredients = {
        {type="item", name="wood", amount=1},
        {type="item", name="copper-cable", amount=2}
      },
      results = {{type="item", name="wood-transport-belt", amount=2}}
    },
    {
      type = "recipe",
      name = "wood-underground-belt",
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name="basic-gear-wheel", amount=6},
        {type="item", name="wood-transport-belt", amount=4}
      },
      results = {{type="item", name="wood-underground-belt", amount=2}}
    },
    {
      type = "recipe",
      name = "wood-splitter",
      enabled = false,
      energy_required = 1,
      ingredients = {
        {type="item", name="basic-gear-wheel", amount=2},
        {type="item", name="wood", amount=5},
        {type="item", name="wood-transport-belt", amount=2}
      },
      results = {{type="item", name="wood-splitter", amount=1}}
    }
  })
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  data:extend({
    {
      type = "recipe",
      name = "big-wood-electric-pole",
      enabled = false,
      ingredients = {
        {type="item", name="small-electric-pole", amount=4},
        {type="item", name="steel-plate", amount=1},
        {type="item", name="copper-cable", amount=4}
      },
      results = {{type="item", name="big-wood-electric-pole", amount=2}}
    }
  })
end
