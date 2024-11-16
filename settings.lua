data:extend({
  -- add wood-tier belts, or simply add wood to belt recipes
  {
    type = "bool-setting",
    name = "wood-logistics-belts",
    setting_type = "startup",
    default_value = true,
    order = "a[logistics]-a[belts]"
  },
  -- add wood to rails recipe
  {
    type = "int-setting",
    name = "wood-logistics-rail-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "a[logistics]-b[rails]"
  },
  -- add wood to inserter recipe
  {
    type = "bool-setting",
    name = "wood-logistics-inserter",
    setting_type = "startup",
    default_value = true,
    order = "a[logistics]-c[inserters]"
  },
  -- add wood to assembling machine 1
  {
    type = "bool-setting",
    name = "wood-logistics-assembling-machine",
    setting_type = "startup",
    default_value = true,
    order = "b[production]"
  },
  -- nerf small wooden electric poles
  {
    type = "bool-setting",
    name = "wood-logistics-nerf-small-electric-pole",
    setting_type = "startup",
    default_value = true,
    order = "c[poles]-a[small]"
  },
  -- add big wooden electric poles
  {
    type = "bool-setting",
    name = "wood-logistics-big-electric-pole",
    setting_type = "startup",
    default_value = true,
    order = "c[poles]-b[big]"
  },
  -- add wood to repair pack recipe
  {
    type = "int-setting",
    name = "wood-logistics-repair-pack-cost",
    setting_type = "startup",
    default_value = 2,
    minimum_value = 0,
    order = "d[repair-pack]"
  },
  -- add wood to automation science packs
  {
    type = "int-setting",
    name = "wood-logistics-red-science-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "e[science]-b[red-cost]"
  }
})
