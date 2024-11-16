require("prototypes.entity.wood-belt-pictures")

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

if settings.startup["wood-logistics-belts"].value then
  data:extend({
    {
      type = "transport-belt",
      name = "wood-transport-belt",
      icon = "__wood-logistics__/graphics/icons/wood-transport-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "wood-transport-belt"},
      max_health = 100,
      resistances = {{type="fire", percent = -90}},
      corpse = "wood-transport-belt-remnants",
      dying_explosion = "wood-transport-belt-explosion",
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound = {
        sound = {
          filename = "__base__/sound/transport-belt.ogg",
          volume = 0.17
        },
        persistent = true
      },
      animation_speed_coefficient = 32,
      belt_animation_set = wood_belt_animation_set,
      fast_replaceable_group = "transport-belt",
      related_underground_belt = "wood-underground-belt",
      next_upgrade = "transport-belt",
      speed = 0.015625,
      connector_frame_sprites = transport_belt_connector_frame_sprites,
      circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
      circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
      circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
    },
    {
      type = "underground-belt",
      name = "wood-underground-belt",
      icon = "__wood-logistics__/graphics/icons/wood-underground-belt.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "wood-underground-belt"},
      max_health = 100,
      corpse = "wood-underground-belt-remnants",
      dying_explosion = "wood-underground-belt-explosion",
      max_distance = 4,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound = {
        sound = {
          filename = "__base__/sound/underground-belt.ogg",
          volume = 0.2
        },
        max_sounds_per_type = 2,
        audible_distance_modifier = 0.5,
        persistent = true,
        use_doppler_shift = false
      },
      underground_sprite = {
        filename = "__core__/graphics/arrows/underground-lines.png",
        priority = "high",
        width = 64,
        height = 64,
        x = 64,
        scale = 0.5
      },
      underground_remove_belts_sprite = {
        filename = "__core__/graphics/arrows/underground-lines-remove.png",
        priority = "high",
        width = 64,
        height = 64,
        x = 64,
        scale = 0.5
      },
      resistances = {{type="fire", percent = -90}, {type = "impact", percent = 30}},
      collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      animation_speed_coefficient = 32,
      belt_animation_set = wood_belt_animation_set,
      fast_replaceable_group = "transport-belt",
      next_upgrade = "underground-belt",
      speed = 0.015625,
      structure = {
        direction_in = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192,
            scale = 0.5
          }
        },
        direction_out = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        },
        direction_in_side_loading = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y = 192*3,
            scale = 0.5
          }
        },
        direction_out_side_loading = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            y= 192*2,
            scale = 0.5
          }
        },
        back_patch = {
          sheet = {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        },
        front_patch = {
          sheet = {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            scale = 0.5
          }
        }
      }
    },
    {
      type = "splitter",
      name = "wood-splitter",
      icon = "__wood-logistics__/graphics/icons/wood-splitter.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "wood-splitter"},
      max_health = 120,
      resistances = {{type="fire", percent = -90}},
      corpse = "wood-splitter-remnants",
      dying_explosion = "wood-splitter-explosion",
      collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
      selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
      damaged_trigger_effect = hit_effects.entity(),
      animation_speed_coefficient = 32,
      structure_animation_speed_coefficient = 0.7,
      structure_animation_movement_cooldown = 10,
      fast_replaceable_group = "transport-belt",
      next_upgrade = "splitter",
      speed = 0.015625,
      belt_animation_set = wood_belt_animation_set,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound = sounds.splitter,
      structure = {
        north = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 160,
          height = 70,
          shift = util.by_pixel(7, 0),
          scale = 0.5
        },
        east = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 84,
          shift = util.by_pixel(4, 13),
          scale = 0.5
        },
        south = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 164,
          height = 64,
          shift = util.by_pixel(4, 0),
          scale = 0.5
        },
        west = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 86,
          shift = util.by_pixel(6, 12),
          scale = 0.5
        }
      },
      structure_patch = {
        north = util.empty_sprite(),
        east = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-east-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 104,
          shift = util.by_pixel(4, -20),
          scale = 0.5
        },
        south = util.empty_sprite(),
        west = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-west-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 90,
          height = 96,
          shift = util.by_pixel(6, -18),
          scale = 0.5
        }
      }
    },
  })
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  data:extend({
    {
      type = "electric-pole",
      name = "big-wood-electric-pole",
      icon = "__wood-logistics__/graphics/icons/big-wood-electric-pole.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "big-wood-electric-pole"},
      max_health = 150,
      corpse = "big-wood-electric-pole-remnants",
      dying_explosion = "big-wood-electric-pole-explosion",
      resistances = {{type = "fire", percent = -90}},
      collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
      selection_box = {{-1, -1}, {1, 1}},
      damaged_trigger_effect = hit_effects.entity({{-0.5, -2.5},{0.5, 0.5}}),
      drawing_box = {{-1, -3}, {1, 0.5}},
      maximum_wire_distance = 22,
      supply_area_distance = 1,
      impact_category = "wood",
      open_sound = sounds.electric_network_open,
      close_sound = sounds.electric_network_close,
      fast_replaceable_group = "big-electric-pole",
      pictures = {
        layers = {
          {
            filename = "__wood-logistics__/graphics/entity/big-wood-electric-pole/hr-big-wood-electric-pole.png",
            priority = "extra-high",
            width = 148,
            height = 312,
            direction_count = 4,
            shift = util.by_pixel(0, -51),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-shadow.png",
            priority = "extra-high",
            width = 374,
            height = 94,
            direction_count = 4,
            shift = util.by_pixel(60, 0),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      },
      connection_points = {
        {
          shadow = {
            copper = util.by_pixel_hr(245.0, -34.0),
            red = util.by_pixel_hr(301.0, -0.0),
            green = util.by_pixel_hr(206.0, -0.0)
          },
          wire = {
            copper = util.by_pixel_hr(0, -246.0),
            red = util.by_pixel_hr(58.0, -211.0),
            green = util.by_pixel_hr(-58.0, -211.0)
          }
        },
        {
          shadow = {
            copper = util.by_pixel_hr(279.0, -24.0),
            red = util.by_pixel_hr(284.0, 28.0),
            green = util.by_pixel_hr(204.0, -31.0)
          },
          wire = {
            copper = util.by_pixel_hr(34.0, -235.0),
            red = util.by_pixel_hr(41.0, -183.0),
            green = util.by_pixel_hr(-40.0, -240.0)
          }
        },
        {
          shadow = {
            copper = util.by_pixel_hr(292.0, 0.0),
            red = util.by_pixel_hr(244.0, 41.0),
            green = util.by_pixel_hr(244.0, -41.0)
          },
          wire = {
            copper = util.by_pixel_hr(47.0, -212.0),
            red = util.by_pixel_hr(1.0, -170.0),
            green = util.by_pixel_hr(1.0, -251.0)
          }
        },
        {
          shadow = {
            copper = util.by_pixel_hr(277.0, 23.0),
            red = util.by_pixel_hr(204.0, 30.0),
            green = util.by_pixel_hr(286.0, -29.0)
          },
          wire = {
            copper = util.by_pixel_hr(33.0, -188.0),
            red = util.by_pixel_hr(-41.0, -182.5),
            green = util.by_pixel_hr(41.0, -239.0)
          }
        }
      },
      radius_visualisation_picture = {
        filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
        width = 12,
        height = 12,
        priority = "extra-high-no-scale"
      },
      water_reflection = {
        pictures = {
          filename = "__base__/graphics/entity/big-electric-pole/big-electric-pole-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 32,
          shift = util.by_pixel(0, 60),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  })
end