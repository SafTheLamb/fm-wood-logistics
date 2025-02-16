local item_sounds = require("__base__.prototypes.item_sounds")
local wood_logistics_item_sounds = require("__wood-logistics__.prototypes.item_sounds")

-------------------------------------------------------------------------- Intermediates

if settings.startup["wood-logistics-lumber"].value then
  data:extend({
    {
      type = "item",
      name = "lumber",
      icon = "__wood-base-assets__/graphics/icons/lumber.png",
      icon_size = 64,
      pictures = {
        {size = 64, filename = "__wood-base-assets__/graphics/icons/lumber.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__wood-base-assets__/graphics/icons/lumber-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__wood-base-assets__/graphics/icons/lumber-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "intermediate-product",
      order = "A[basic-intermediates]-c[lumber]",
      inventory_move_sound = item_sounds.wood_inventory_move,
      pick_sound = item_sounds.wood_inventory_pickup,
      drop_sound = item_sounds.wood_inventory_move,
      stack_size = 100,
      random_tint_color = {1.0, 0.95, 0.9, 1.0},
      fuel_category = "chemical",
      fuel_value = "4MJ"
    }
  })
end

-------------------------------------------------------------------------- Lumber mill

if settings.startup["wood-logistics-lumber-mill"].value then
  data:extend({
    {
      type = "item",
      name = "lumber-mill",
      icon = "__wood-base-assets__/graphics/icons/lumber-mill.png",
      subgroup = "production-machine",
      order = "eb[lumber-mill]",
      place_result = "lumber-mill",
      stack_size = 20,
    },
  })
end

-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "item",
      name = "wood-transport-belt",
      icon = "__wood-base-assets__/graphics/icons/wood-transport-belt.png",
      subgroup = "belt",
      order = "a[transport-belt]-A[transport-belt]",
      inventory_move_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_move,
      pick_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_pickup,
      drop_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_move,
      place_result = "wood-transport-belt",
      stack_size = 100
    },
    {
      type = "item",
      name = "wood-underground-belt",
      icon = "__wood-base-assets__/graphics/icons/wood-underground-belt.png",
      subgroup = "belt",
      order = "b[underground-belt]-A[wood-underground-belt]",
      inventory_move_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_move,
      pick_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_pickup,
      drop_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_move,
      place_result = "wood-underground-belt",
      stack_size = 50
    },
    {
      type = "item",
      name = "wood-splitter",
      icon = "__wood-base-assets__/graphics/icons/wood-splitter.png",
      subgroup = "belt",
      order = "c[splitter]-A[wood-splitter]",
      inventory_move_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_move,
      pick_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_pickup,
      drop_sound = wood_logistics_item_sounds.wood_transport_belt_inventory_move,
      place_result = "wood-splitter",
      stack_size = 50
    }
  })
end

-------------------------------------------------------------------------- Trains

if settings.startup["wood-logistics-cargo-wagon"].value then
  data:extend({
    {
      type = "item-with-entity-data",
      name = "wood-cargo-wagon",
      icon = "__wood-base-assets__/graphics/icons/wood-cargo-wagon.png",
      subgroup = "train-transport",
      order = "c[rolling-stock]-b[cargo-wagon]a",
      inventory_move_sound = item_sounds.wood_inventory_move,
      pick_sound = item_sounds.locomotive_inventory_pickup,
      drop_sound = item_sounds.wood_inventory_move,
      place_result = "wood-cargo-wagon",
      stack_size = 5
    }
  })
end

-------------------------------------------------------------------------- Electric poles

if settings.startup["wood-logistics-big-electric-pole"].value then
  data:extend({
    {
      type = "item",
      name = "big-wood-electric-pole",
      icon = "__wood-base-assets__/graphics/icons/big-wood-electric-pole.png",
      subgroup = "energy-pipe-distribution",
      order = "a[energy]-c[big-electric-pole]b",
      inventory_move_sound = item_sounds.electric_large_inventory_move,
      pick_sound = item_sounds.electric_large_inventory_pickup,
      drop_sound = item_sounds.electric_large_inventory_move,
      place_result = "big-wood-electric-pole",
      stack_size = 50
    }
  })
end
