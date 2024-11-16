local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local sounds = require("__base__.prototypes.entity.sounds")

if settings.startup["wood-logistics-belts"].value == "item" then
  data:extend({
    {
      type = "explosion",
      name = "wood-transport-belt-explosion",
      icon = "__wood-logistics__/graphics/icons/wood-transport-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"not-on-map"},
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

if settings.startup["wood-logistics-big-electric-pole"].value == "item" then
  data:extend({
    {
      type = "explosion",
      name = "big-wood-electric-pole-explosion",
      icon = "__wood-logistics__/graphics/icons/big-wood-electric-pole.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"not-on-map"},
      subgroup = "energy-pipe-distribution-explosions",
      order = "d-d-a",
      height = 0,
      animations = explosion_animations.medium_explosion(),
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 1,
      sound = sounds.medium_explosion,
      created_effect = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-particle",
              repeat_count = 25,
              particle_name = "small-electric-pole-wooden-splinter-particle-medium",
              offset_deviation = {{-0.5, -0.6953}, {0.5, 0.6953}},
              initial_height = 0.8,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.069,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05
            },
            {
              type = "create-particle",
              repeat_count = 10,
              particle_name = "cable-and-electronics-particle-small-medium",
              offset_deviation = {{-0.6953, -0.2969}, {0.6953, 0.2969}},
              initial_height = 0.5,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0.04,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.02,
              speed_from_center_deviation = 0.043
            },
            {
              type = "create-particle",
              repeat_count = 30,
              particle_name = "small-electric-pole-wooden-splinter-particle-small",
              offset_deviation = {{-0.5977, -0.7891}, {0.5977, 0.7891}},
              initial_height = 0.4,
              initial_height_deviation = 0.44,
              initial_vertical_speed = 0.053,
              initial_vertical_speed_deviation = 0.05,
              speed_from_center = 0.06,
              speed_from_center_deviation = 0.05
            }
          }
        }
      }
    },
  })
end
