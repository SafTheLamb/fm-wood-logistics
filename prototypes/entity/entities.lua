require("prototypes.entity.wood-belt-pictures")

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

if settings.startup["wood-logistics-belts"].value == "item" then
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
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96,
            hr_version = {
              filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height =192,
              y = 192,
              scale = 0.5
            }
          }
        },
        direction_out = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            hr_version = {
              filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              scale = 0.5
            }
          }
        },
        direction_in_side_loading = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96*3,
            hr_version = {
              filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y = 192*3,
              scale = 0.5
            }
          }
        },
        direction_out_side_loading = {
          sheet = {
            filename = "__wood-logistics__/graphics/entity/wood-underground-belt/wood-underground-belt-structure.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            y = 96*2,
            hr_version = {
              filename = "__wood-logistics__/graphics/entity/wood-underground-belt/hr-wood-underground-belt-structure.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              y= 192*2,
              scale = 0.5
            },
          }
        },
        back_patch = {
          sheet = {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            hr_version = {
              filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-back-patch.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              scale = 0.5
            }
          }
        },
        front_patch = {
          sheet = {
            filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
            priority = "extra-high",
            width = 96,
            height = 96,
            hr_version = {
              filename = "__base__/graphics/entity/underground-belt/hr-underground-belt-structure-front-patch.png",
              priority = "extra-high",
              width = 192,
              height = 192,
              scale = 0.5
            }
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
      belt_animation_set = basic_belt_animation_set,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound = sounds.splitter,
      structure = {
        north = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-north.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 82,
          height = 36,
          shift = util.by_pixel(6, 0),
          hr_version = {
            filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-north.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 160,
            height = 70,
            shift = util.by_pixel(7, 0),
            scale = 0.5
          }
        },
        east = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-east.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 44,
          shift = util.by_pixel(4, 12),
          hr_version = {
            filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-east.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 84,
            shift = util.by_pixel(4, 13),
            scale = 0.5
          }
        },
        south = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-south.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 82,
          height = 32,
          shift = util.by_pixel(4, 0),
          hr_version = {
            filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-south.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 164,
            height = 64,
            shift = util.by_pixel(4, 0),
            scale = 0.5
          }
        },
        west = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-west.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 44,
          shift = util.by_pixel(6, 12),
          hr_version = {
            filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-west.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 86,
            shift = util.by_pixel(6, 12),
            scale = 0.5
          }
        }
      },
      structure_patch = {
        north = util.empty_sprite(),
        east = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-east-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 52,
          shift = util.by_pixel(4, -20),
          hr_version = {
            filename = "__wood-logistics__/graphics/entity/wood-splitter/hr-wood-splitter-east-top_patch.png",
            frame_count = 32,
            line_length = 8,
            priority = "extra-high",
            width = 90,
            height = 104,
            shift = util.by_pixel(4, -20),
            scale = 0.5
          }
        },
        south = util.empty_sprite(),
        west = {
          filename = "__wood-logistics__/graphics/entity/wood-splitter/wood-splitter-west-top_patch.png",
          frame_count = 32,
          line_length = 8,
          priority = "extra-high",
          width = 46,
          height = 48,
          shift = util.by_pixel(6, -18),
          hr_version = {
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
      }
    },
  })
end
