-------------------------------------------------------------------------- Intermediates
local add_basic_gear_wheel =
  settings.startup["wood-logistics-belts"].value
  or settings.startup["wood-logistics-assembling-machine"].value
  or settings.startup["wood-logistics-inserter"].value
if add_basic_gear_wheel then
  data:extend({
    {
      type = "item",
      name = "basic-gear-wheel",
      icon = "__wood-logistics__/graphics/icons/basic-gear-wheel.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "intermediate-product",
      order = "c[gear-wheel]-a[basic]",
      stack_size = 100
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
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "belt",
      order = "a[transport-belt]-A[transport-belt]",
      place_result = "wood-transport-belt",
      stack_size = 100
    },
    {
      type = "item",
      name = "wood-underground-belt",
      icon = "__wood-logistics__/graphics/icons/wood-underground-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "belt",
      order = "b[underground-belt]-A[wood-underground-belt]",
      place_result = "wood-underground-belt",
      stack_size = 50
    },
    {
      type = "item",
      name = "wood-splitter",
      icon = "__wood-logistics__/graphics/icons/wood-splitter.png",
      icon_size = 64, icon_mipmaps = 4,
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
      icon_size = 64, icon_mipmaps = 4,
      subgroup = "energy-pipe-distribution",
      order = "a[energy]-c[big-electric-pole]b",
      place_result = "big-wood-electric-pole",
      stack_size = 50
    }
  })
end
