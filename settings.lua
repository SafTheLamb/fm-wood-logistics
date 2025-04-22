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
  {
    type = "bool-setting",
    name = "wood-logistics-woodtronics",
    setting_type = "startup",
    default_value = true,
    order = "a[lumber]-c[woodtronics]"
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
  -- whether you can connect circuits to wooden belts (default off... they're made of wood!)
  {
    type = "bool-setting",
    name = "wood-logistics-belts-circuits",
    setting_type = "startup",
    default_value = false,
    order = "b[logistics]-a[belts]-c[circuits]"
  },
  -- add wood to inserter recipe
  {
    type = "bool-setting",
    name = "wood-logistics-inserter",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-b[inserters]"
  },
  {
    type = "int-setting",
    name = "wood-logistics-rail-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "b[logistics]-c[trains]-a[rails]"
  },
  {
    type = "bool-setting",
    name = "wood-logistics-cargo-wagon",
    setting_type = "startup",
    default_value = true,
    order = "b[logistics]-c[trains]-b[wagon]"
  },
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
  -- add wood to repair pack recipe
  {
    type = "int-setting",
    name = "wood-logistics-repair-pack-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "m[misc]-a[repair-pack]"
  }
})
