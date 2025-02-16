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
end

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
  end
end

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
