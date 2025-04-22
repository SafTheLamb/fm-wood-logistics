local recipe_category = settings.startup["wood-logistics-lumber-mill"].value and "crafting-or-carpentry" or "crafting"
local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

if mods["deadlock-beltboxes-loaders"] then
  if settings.startup["wood-logistics-belts"].value then
    deadlock.add_tier({
      transport_belt      = "wood-transport-belt",
      colour              = util.color("a06e5ad1"),
      underground_belt    = "wood-underground-belt",
      splitter            = "wood-splitter",
      technology          = "wood-logistics",
      order               = "A",
      loader_ingredients  = {
        {type="item", name="wood-transport-belt", amount=1},
        {type="item", name=lumber_item, amount=5},
      },
      beltbox_ingredients = {
        {type="item", name="wood-transport-belt", amount=4},
        {type="item", name=lumber_item, amount=10},
        mods["aai-industry"] and {type="item", name="motor", amount=2} or {type="item", name="copper-cable", amount=10},
      },
      beltbox_technology  = "deadlock-stacking-0",
    })
    if data.raw.technology["deadlock-stacking-1"] then
      table.insert(data.raw.technology["deadlock-stacking-1"].prerequisites, "deadlock-stacking-0")
    end
    data.raw.recipe["wood-transport-belt-loader"].category = recipe_category
    if data.raw["loader-1x1"]["wood-transport-belt-loader"] then
      data.raw["loader-1x1"]["wood-transport-belt-loader"].next_upgrade = "transport-belt-loader"
    end
    if data.raw.furnace["wood-transport-belt-beltbox"] then
      data.raw.furnace["wood-transport-belt-beltbox"].next_upgrade = "transport-belt-beltbox"
    end
  end

  if settings.startup["wood-logistics-lumber"].value then
    deadlock.add_stack("lumber", nil, "deadlock-stacking-0")
  end
end
