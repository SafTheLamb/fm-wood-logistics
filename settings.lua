local modutil = require("modutil")

data:extend({
  -- add wood-tier belts, or simply add wood to belt recipes
  {
    type = "string-setting",
    name = "wood-logistics-belts",
    setting_type = "startup",
    allowed_values = {"item", "recipe", "no"},
    default_value = "item",
    order = "a[belts]"
  },
  -- add wood to rails recipe
  {
    type = "int-setting",
    name = "wood-logistics-rail-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "b[rails]"
  },
  -- add small electric poles to metal electric pole recipe
  {
    type = "string-setting",
    name = "wood-logistics-small-electric-pole",
    setting_type = "startup",
    allowed_values = modutil.aai_industry and {"pole", "no"} or {"pole", "wood", "no"}, -- that would be silly!~
    default_value = "pole",
    order = "c[poles]-a[small]"
  },
  -- add big wooden electric poles
  -- {
  --   type = "string-setting",
  --   name = "wood-logistics-big-electric-pole",
  --   setting_type = "startup",
  --   allowed_values = {"item", "recipe", "no"},
  --   default_value = "item",
  --   order = "c[poles]-b[big]"
  -- },
  -- add wood to repair pack recipe
  {
    type = "int-setting",
    name = "wood-logistics-repair-pack-cost",
    setting_type = "startup",
    default_value = 3,
    minimum_value = 0,
    order = "d[repair-pack]"
  },
  -- wood or basic gears for automation science packs
  {
    type = "string-setting",
    name = "wood-logistics-red-science-item",
    setting_type = "startup",
    allowed_values = {"wood", "basic-gear-wheel"},
    default_value = "basic-gear-wheel",
    order = "e[science]-a[red-item]"
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
