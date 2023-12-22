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
    type = "bool-setting",
    name = "wood-logistics-small-electric-pole",
    setting_type = "startup",
    default_value = true,
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
    default_value = 2,
    minimum_value = 0,
    order = "d[repair-pack]"
  },
  -- add wood to automation science packs (red science)
  {
    type = "int-setting",
    name = "wood-logistics-red-science-cost",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0,
    order = "e[science]-a[red-cost]"
  }
})
