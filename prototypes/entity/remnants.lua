-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "corpse",
      name = "wood-transport-belt-remnants",
      icon = "__wood-logistics__/graphics/icons/wood-transport-belt.png",
      flags = {"placeable-neutral", "not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "belt-remnants",
      order = "a-a-a",
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      animation =  make_rotated_animation_variations_from_sheet(2, {
        filename = "__wood-logistics__/graphics/entity/wood-transport-belt/remnants/wood-transport-belt-remnants.png",
        line_length = 1,
        width = 106,
        height = 102,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(1, -0.5),
        scale = 0.5
      })
    },

    {
      type = "corpse",
      name = "wood-underground-belt-remnants",
      icon = "__wood-logistics__/graphics/icons/wood-underground-belt.png",
      flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "belt-remnants",
      order="a-d-a",
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = {
        filename = "__wood-logistics__/graphics/entity/wood-underground-belt/remnants/wood-underground-belt-remnants.png",
        line_length = 1,
        width = 156,
        height = 144,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(10.5, 3),
        scale = 0.5
      }
    },

    {
      type = "corpse",
      name = "wood-splitter-remnants",
      icon = "__wood-logistics__/graphics/icons/wood-splitter.png",
      flags = {"placeable-neutral", "not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "belt-remnants",
      order = "a-g-a",
      selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
      tile_width = 2,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = {
        filename = "__wood-logistics__/graphics/entity/wood-splitter/remnants/wood-splitter-remnants.png",
        line_length = 1,
        width = 190,
        height = 190,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 4,
        shift = util.by_pixel(3.5, 1.5),
        scale = 0.5
      }
    }
  })
end

-------------------------------------------------------------------------- Lumber mill

if settings.startup["wood-logistics-lumber-mill"].value then
  data:extend({
    {
      type = "corpse",
      name = "lumber-mill-remnants",
      icon = "__wood-logistics__/graphics/icons/lumber-mill.png",
      flags = {"placeable-neutral", "not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "production-machine-remnants",
      order = "f[lumber-mill]",
      selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
      tile_width = 6,
      tile_height = 6,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      expires = false,
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = {
        filename = mods["space-age"] and "__space-age__/graphics/entity/foundry/foundry-remnants.png" or "__base__/graphics/entity/oil-refinery/remnants/refinery-remnants.png",
        line_length = 1,
        width = mods["space-age"] and 494 or 467,
        height = mods["space-age"] and 478 or 415,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel( -1.5, -6.5),
        scale = 0.6
      }
    },
  })
end

-------------------------------------------------------------------------- Trains

if settings.startup["wood-logistics-cargo-wagon"].value then
  data:extend({
    {
      type = "corpse",
      name = "wood-cargo-wagon-remnants",
      icon = "__wood-logistics__/graphics/icons/wood-cargo-wagon.png",
      flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "train-transport-remnants",
      order = "a-g-a",
      selection_box = {{-1.0, -3.0}, {1.0, 3.0}},
      tile_width = 2,
      tile_height = 6,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = {
        filename = "__wood-logistics__/graphics/entity/wood-cargo-wagon/remnants/wood-cargo-wagon-remnants.png",
        line_length = 1,
        width = 494,
        height = 484,
        direction_count = 8,
        shift = util.by_pixel(1.5, 6),
        scale = 0.5
      }
    }
  })
end
