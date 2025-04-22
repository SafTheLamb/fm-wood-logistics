if mods["Voidcraft"] then
  local vcc = require("__Voidcraft__.prototypes.costs")
  
  local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"
  local woodchips_bad_product = mods["wood-industry"] and "woodchips" or "wood"
  local scrapamt = mods["wood-industry"] and 2 or 1
  
  VOIDCRAFT.create_auto_groups({{"voidcraft-wood", "vccw"}})

  if settings.startup["wood-logistics-lumber"].value then
    data:extend({
      VOIDCRAFT.voidcraft_recipe({prefix="__wood-logistics__", subgroup="voidcraft-wood", amt2=scrapamt}, {"lumber", woodchips_bad_product, "carbon"}, "vcab-g", 2*vcc.basic_resource, "s6x-voidcraft", {0.48, 0.4, 0.1})
    })
  end
  if settings.startup["wood-logistics-belts"].value then
    data:extend({
      VOIDCRAFT.voidcraft_recipe({prefix="__wood-logistics__", subgroup="voidcraft-wood", entity=true}, {"wood-transport-belt", lumber_item, "copper-cable"}, "vcb-Aa", 0.5*vcc.transport_belt, "s6x-void-belts", {0.48, 0.4, 0.1}),
      VOIDCRAFT.voidcraft_recipe({prefix="__wood-logistics__", subgroup="voidcraft-wood", entity=true, amount_main=2}, {"wood-underground-belt", lumber_item, "wood-transport-belt"}, "vcb-Ab", 0.5*vcc.underground_belt, "s6x-void-belts", {0.48, 0.4, 0.1}),
      VOIDCRAFT.voidcraft_recipe({prefix="__wood-logistics__", subgroup="voidcraft-wood", entity=true}, {"wood-splitter", lumber_item, "wood-transport-belt"}, "vcb-Ac", 0.5*vcc.splitter, "s6x-void-belts", {0.48, 0.4, 0.1}),
    })
  end
end
