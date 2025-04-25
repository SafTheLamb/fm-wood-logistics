local frep = require("__fdsl__.lib.recipe")

local recipe_category = settings.startup["wood-logistics-lumber-mill"].value and "crafting-or-carpentry" or "crafting"
local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

if mods["aai-loaders"] and settings.startup["wood-logistics-belts"].value then
  AAILoaders.make_tier{
    name = "wood",
    transport_belt = "wood-transport-belt",
    color = {123, 73, 54},
    fluid = "steam",
    fluid_per_minute = 7.5,
    fluid_technology_prerequisites = mods["aai-industry"] and {"steam-power"} or nil,
    technology = {
      unit = {
        count = mods["aai-industry"] and 50 or 25,
        ingredients = (mods["aai-industry"] and settings.startup["aai-loaders-mode"].value == "lubricated") and {{"automation-science-pack", 1}, {"logistic-science-pack", 1}} or {{"automation-science-pack", 1}},
        time = 15
      },
      prerequisites = {"wood-logistics"}
    },
    recipe = {
      ingredients = {
        {type="item", name=lumber_item, amount=5},
        mods["aai-industry"] and {type="item", name="motor", amount=2} or {type="item", name="copper-cable", amount=10},
        {type="item", name="wood-transport-belt", amount=1}
      },
      energy_required = 1
    },
    unlubricated_recipe = {
      ingredients = {
        {type="item", name=lumber_item, amount=50},
        mods["aai-industry"] and {type="item", name="motor", amount=20} or {type="item", name="copper-cable", amount=100},
        {type="item", name="wood-transport-belt", amount=1}
      },
      energy_required = 5
    },
    next_upgrade = "aai-loader",
    localise = false
  }
  if settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
    data.raw.item["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
    data.raw.recipe["aai-wood-loader"].category = recipe_category
    data.raw.recipe["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
    if settings.startup["wood-logistics-belts-modify"].value then
      frep.replace_ingredient("aai-loader", "transport-belt", "aai-wood-loader")
    end
  end
end
