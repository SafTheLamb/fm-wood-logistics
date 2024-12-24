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
        ingredients = mods["aai-industry"] and {{"automation-science-pack", 1}, {"logistic-science-pack", 1}} or {{"automation-science-pack", 1}},
        time = 15
      },
      prerequisites = {"wood-logistics"}
    },
    recipe = {
      ingredients = {
        {type="item", name=lumber_item, amount=5},
        {type="item", name="copper-cable", amount=10},
        {type="item", name="wood-transport-belt", amount=1}
      },
      energy_required = 1
    },
    unlubricated_recipe = {
      ingredients = {
        {type="item", name=lumber_item, amount=50},
        {type = "item", name = "copper-cable", amount = 100},
        {type = "item", name = "wood-transport-belt", amount = 1}
      },
      energy_required = 5
    },
    next_upgrade = "aai-loader",
    localise = false
  }
end

if mods["vanilla-loaders-hd"] then
  local vanilla_loaders_api = require("__vanilla-loaders-hd__.prototypes.api")
  if settings.startup["wood-logistics-belts"].value then
    vanilla_loaders_api.create_loader("wood-loader", "wood-transport-belt", {
      technology = "wood-logistics",
      mask_tint = util.color("a06e5ad1"),
      base_tint = util.color("7B4936"),
      ingredients = {
        {type="item", name=lumber_item, amount=5},
        {type="item", name="copper-cable", amount=10},
        {type="item", name="wood-transport-belt", amount=1}
      },
      next_tier = "loader"
    })
  end
end
