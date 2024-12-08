-------------------------------------------------------------------------- Intermediates

if settings.startup["wood-logistics-lumber"].value then
  data:extend({
    {
      type = "item",
      name = "lumber",
      icon = "__wood-logistics__/graphics/icons/lumber.png",
      pictures = {
        {size = 64, filename = "__wood-logistics__/graphics/icons/lumber.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__wood-logistics__/graphics/icons/lumber-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__wood-logistics__/graphics/icons/lumber-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "intermediate-product",
      order = "A[basic-intermediates]-c[lumber]",
      stack_size = 100,
      random_tint_color = {1.0, 0.95, 0.9, 1.0},
      fuel_category = "chemical",
      fuel_value = "4MJ"
    }
  })
end

-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "item",
      name = "wood-transport-belt",
      icon = "__wood-logistics__/graphics/icons/wood-transport-belt.png",
      subgroup = "belt",
      order = "a[transport-belt]-A[transport-belt]",
      place_result = "wood-transport-belt",
      stack_size = 100
    },
    {
      type = "item",
      name = "wood-underground-belt",
      icon = "__wood-logistics__/graphics/icons/wood-underground-belt.png",
      subgroup = "belt",
      order = "b[underground-belt]-A[wood-underground-belt]",
      place_result = "wood-underground-belt",
      stack_size = 50
    },
    {
      type = "item",
      name = "wood-splitter",
      icon = "__wood-logistics__/graphics/icons/wood-splitter.png",
      subgroup = "belt",
      order = "c[splitter]-A[wood-splitter]",
      place_result = "wood-splitter",
      stack_size = 50
    }
  })
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  data:extend({
    {
      type = "item",
      name = "big-wood-electric-pole",
      icon = "__wood-logistics__/graphics/icons/big-wood-electric-pole.png",
      subgroup = "energy-pipe-distribution",
      order = "a[energy]-c[big-electric-pole]b",
      place_result = "big-wood-electric-pole",
      stack_size = 50
    }
  })
end
