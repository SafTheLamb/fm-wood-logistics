local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local sounds = require("__base__.prototypes.entity.sounds")

-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "explosion",
      name = "wood-transport-belt-explosion",
      icon = "__wood-logistics__/graphics/icons/wood-transport-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "belt-explosions",
      order = "b-a-a",
      height = 0,
      animations = util.empty_sprite(),
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = sounds.small_explosion,
      created_effect = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-particle",
              repeat_count = 4,
              particle_name = "transport-belt-metal-particle-small",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.071,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.03,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 20,
              particle_name = "transport-belt-wooden-splinter-particle-medium",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.08,
              initial_vertical_speed_deviation = 0.016,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.05
            }
          }
        }
      }
    },

    {
      type = "explosion",
      name = "wood-underground-belt-explosion",
      icon = "__wood-logistics__/graphics/icons/wood-underground-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "belt-explosions",
      order = "b-d-a",
      height = 0,
      animations = explosion_animations.small_explosion(),
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = sounds.small_explosion,
      created_effect = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-particle",
              repeat_count = 25,
              particle_name = "underground-belt-metal-particle-small",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.2,
              initial_height_deviation = 0.43,
              initial_vertical_speed = 0.087,
              initial_vertical_speed_deviation = 0.048,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 20,
              particle_name = "transport-belt-wooden-splinter-particle-medium",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.08,
              initial_vertical_speed_deviation = 0.016,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.05
            }
          }
        }
      }
    },

    {
      type = "explosion",
      name = "wood-splitter-explosion",
      icon = "__wood-logistics__/graphics/icons/wood-splitter.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "belt-explosions",
      order = "b-g-a",
      height = 0,
      animations = explosion_animations.small_explosion(),
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = sounds.small_explosion,
      created_effect = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-particle",
              repeat_count = 25,
              particle_name = "splitter-metal-particle-small",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.6,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.049,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 3,
              particle_name = "splitter-long-metal-particle-medium",
              offset_deviation = {{-0.6953, -0.5977}, {0.6953, 0.5977}},
              initial_height = 0.4,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.072,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.03,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 3,
              particle_name = "splitter-mechanical-component-particle-medium",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.2,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.029,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 20,
              particle_name = "transport-belt-wooden-splinter-particle-medium",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.08,
              initial_vertical_speed_deviation = 0.016,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.05
            }
          }
        }
      }
    },
  })
end

-------------------------------------------------------------------------- Lumber mill

if settings.startup["wood-logistics-lumber-mill"].value then
  data:extend({
    {
      type = "explosion",
      name = "lumber-mill-explosion",
      icon = "__wood-logistics__/graphics/icons/lumber-mill.png",
      flags = {"not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "production-machine-explosions",
      order = "d[foundry]",
      height = 0,
      animations = explosion_animations.big_explosion(),
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = sounds.large_explosion(0.7, 1.0),
      created_effect = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-particle",
              repeat_count = 10,
              probability = 1,
              particle_name = "oil-refinery-metal-particle-big",
              offsets = {{0.7734, -0.6484}, {-0.7266, 0.5859}},
              offset_deviation = {{-0.6875, -0.6875}, {0.6875, 0.6875}},
              initial_height = 0.8,
              initial_height_deviation = 0.49,
              initial_vertical_speed = 0.088,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.03,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 38,
              probability = 1,
              particle_name = "wooden-chest-wooden-splinter-particle-medium",
              offsets = {{0, 0}},
              offset_deviation = {{-0.9805, -0.8867}, {0.9805, 0.8867}},
              initial_height = 0.6,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.098,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.07,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 10,
              probability = 1,
              particle_name = "oil-refinery-metal-particle-medium",
              offsets ={
                {-1.492, -1.453},
                {1.555, -1.469},
                {1.477, 1.469},
                {-0.6172, 0.3281}
              },
              offset_deviation = {{-0.9961, -0.5938}, {0.9961, 0.5938}},
              initial_height = 0.4,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.075,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 35,
              probability = 1,
              particle_name = "oil-refinery-long-metal-particle-medium",
              offsets = {{-0.02344, -0.8984}},
              offset_deviation = {{-0.5, -0.2969}, {0.5, 0.2969}},
              initial_height = 0.7,
              initial_height_deviation = 0.15,
              initial_vertical_speed = 0.166,
              initial_vertical_speed_deviation = 0.047,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.005
            },
            {
              type = "create-particle",
              repeat_count = 20,
              particle_name = "transport-belt-wooden-splinter-particle-medium",
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
              initial_height = 0.5,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.06,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.05
            },
          }
        }
      }
    }
  })
end

-------------------------------------------------------------------------- Trains

if settings.startup["wood-logistics-cargo-wagon"].value then
  data:extend({
    {
      type = "explosion",
      name = "wood-cargo-wagon-explosion",
      icon = "__wood-logistics__/graphics/icons/wood-cargo-wagon.png",
      flags = {"not-on-map"},
      hidden = true,
      hidden_in_factoriopedia = true,
      subgroup = "train-transport-explosions",
      order = "e-g-a",
      height = 0,
      animations = explosion_animations.medium_explosion(),
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = sounds.large_explosion(0.8),
      created_effect = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-particle",
              repeat_count = 36,
              particle_name = "wooden-chest-wooden-splinter-particle-medium",
              offset_deviation = { { -0.3984, -0.3984 }, { 0.3984, 0.3984 } },
              initial_height = 0.4,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.11,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.04,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 37,
              particle_name = "transport-belt-wooden-splinter-particle-medium",
              offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.109,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 35,
              particle_name = "rail-wooden-splinter-particle-medium",
              offset_deviation = { { -0.5977, -0.5977 }, { 0.5977, 0.5977 } },
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.114,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05
            }
          }
        }
      }
    }
  })
end
