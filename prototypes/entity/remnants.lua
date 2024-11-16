if settings.startup["wood-logistics-belts"].value == "item" then
  data:extend({
    {
      type = "corpse",
      name = "wood-transport-belt-remnants",
      icon = "__wood-logistics__/graphics/icons/wood-transport-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "not-on-map"},
      subgroup = "belt-remnants",
      order = "a-a-a",
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      animation =  make_rotated_animation_variations_from_sheet(2, {
        filename = "__wood-logistics__/graphics/entity/wood-transport-belt/remnants/hr-wood-transport-belt-remnants.png",
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
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
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
        filename = "__wood-logistics__/graphics/entity/wood-underground-belt/remnants/hr-wood-underground-belt-remnants.png",
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
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "not-on-map"},
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
        filename = "__wood-logistics__/graphics/entity/wood-splitter/remnants/hr-wood-splitter-remnants.png",
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

if settings.startup["wood-logistics-big-electric-pole"].value == "item" then
  data:extend({
    {
      type = "corpse",
      name = "big-wood-electric-pole-remnants",
      icon = "__wood-logistics__/graphics/icons/big-wood-electric-pole.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "not-on-map"},
      subgroup = "energy-pipe-distribution-remnants",
      order = "a-c-a",
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-1, -1}, {1, 1}},
      tile_width = 2,
      tile_height = 2,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      animation_overlay_final_render_layer = "object",
      remove_on_tile_placement = false,
      animation = make_rotated_animation_variations_from_sheet (4, {
        layers = {
          {
            filename = "__wood-logistics__/graphics/entity/big-wood-electric-pole/remnants/hr-big-wood-electric-pole-base-remnants.png",
            line_length = 1,
            width = 366,
            height = 188,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(43, 0.5),
            scale = 0.5
          }
        }
      }),
      animation_overlay = make_rotated_animation_variations_from_sheet (4, {
        layers = {
          {
            filename = "__wood-logistics__/graphics/entity/big-wood-electric-pole/remnants/hr-big-wood-electric-pole-top-remnants.png",
            line_length = 1,
            width = 148,
            height = 252,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(-1.5, -48),
            scale = 0.5
          }
        }
      })
    },
  })
end
