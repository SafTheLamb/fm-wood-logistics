data:extend({
  -- add wood lumber as an intermediate item to craft from wood
  {
    type = "bool-setting",
    name = "wood-logistics-lumber",
    setting_type = "startup",
    default_value = true,
    order = "a[items]-a[lumber]"
  },
  -- add wood-tier belts, or simply add wood to belt recipes
  {
    type = "bool-setting",
    name = "wood-logistics-belts",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-a[belts]"
  },
  -- add wood to rails recipe
  {
    type = "int-setting",
    name = "wood-logistics-rail-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "b[logistics]-b[rails]"
  },
  -- add wood to inserter recipe
  {
    type = "bool-setting",
    name = "wood-logistics-inserter",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-c[inserters]"
  },
  -- add wood to assembling machine 1
  {
    type = "bool-setting",
    name = "wood-logistics-assembling-machine",
    setting_type = "startup",
    default_value = true,
    order = "c[production]"
  },
  -- nerf small wooden electric poles
  {
    type = "bool-setting",
    name = "wood-logistics-nerf-small-electric-pole",
    setting_type = "startup",
    default_value = true,
    order = "d[poles]-a[small]"
  },
  -- add big wooden electric poles
  {
    type = "bool-setting",
    name = "wood-logistics-big-electric-pole",
    setting_type = "startup",
    default_value = true,
    order = "d[poles]-b[big]"
  },
  -- add wood to repair pack recipe
  {
    type = "int-setting",
    name = "wood-logistics-repair-pack-cost",
    setting_type = "startup",
    default_value = 2,
    minimum_value = 0,
    order = "e[repair-pack]"
  }
})
