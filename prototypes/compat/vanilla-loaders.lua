local recipe_category = settings.startup["wood-logistics-lumber-mill"].value and "crafting-or-carpentry" or "crafting"
local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

if mods["vanilla-loaders-hd"] and settings.startup["wood-logistics-belts"].value then
  local vanilla_loaders_api = require("__vanilla-loaders-hd__.prototypes.api")
  if settings.startup["wood-logistics-belts"].value then
    vanilla_loaders_api.create_loader("wood-loader", "wood-transport-belt", {
      technology = "wood-logistics",
      mask_tint = util.color("a06e5ad1"),
      ingredients = {
        {type="item", name=lumber_item, amount=5},
        {type="item", name="copper-cable", amount=10},
        {type="item", name="wood-transport-belt", amount=1}
      },
      next_tier = "loader"
    })
    data.raw.recipe["wood-loader"].category = recipe_category
  end
end
