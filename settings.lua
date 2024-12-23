data:extend({
  -- add wood lumber as an intermediate item to craft from wood
  {
    type = "bool-setting",
    name = "wood-logistics-lumber",
    setting_type = "startup",
    default_value = true,
    order = "a[lumber]-a[item]"
  },
  {
    type = "bool-setting",
    name = "wood-logistics-lumber-mill",
    setting_type = "startup",
    default_value = true,
    order = "a[lumber]-b[mill]"
  },
  -- add wood-tier belts, or simply add wood to belt recipes
  {
    type = "bool-setting",
    name = "wood-logistics-belts",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-a[belts]-a[add]"
  },
  -- modify vanilla belt recipes to require wood belts
  {
    type = "bool-setting",
    name = "wood-logistics-belts-modify",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-a[belts]-b[modify]"
  },
  -- add wood to inserter recipe
  {
    type = "bool-setting",
    name = "wood-logistics-inserter",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-b[inserters]"
  },
  -- add wooden cargo wagon
  {
    type = "bool-setting",
    name = "wood-logistics-cargo-wagon",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-c[trains]-a[wagon]"
  },
  -- add wood to rails recipe
  {
    type = "int-setting",
    name = "wood-logistics-rail-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "b[logistics]-c[trains]-b[rails]"
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
    default_value = false,
    order = "d[poles]-b[big]-a[add]"
  },
  -- modify vanilla big electric pole recipe to require wood big electric pole
  {
    type = "bool-setting",
    name = "wood-logistics-big-electric-pole-modify",
    setting_type = "startup",
    default_value = false,
    order = "d[poles]-b[big]-b[modify]"
  },
  -- add wood to repair pack recipe
  {
    type = "int-setting",
    name = "wood-logistics-repair-pack-cost",
    setting_type = "startup",
    default_value = 2,
    minimum_value = 0,
    order = "m[misc]-a[repair-pack]"
  }
})
