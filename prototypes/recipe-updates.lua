local Recipe = require("__kry_stdlib__.stdlib.data.recipe")

if settings.startup["wood-logistics-belts"].value then
  Recipe("automation-science-pack"):replace_ingredient("copper-plate", {type="item", name="wood-transport-belt", amount=2})
  if mods["aai-industry"] then
    Recipe("transport-belt"):add_ingredient({type="item", name="wood-transport-belt", amount=2})
  else
    Recipe("transport-belt"):replace_ingredient("iron-plate", {type="item", name="wood-transport-belt", amount=2})
  end
  Recipe("underground-belt"):replace_ingredient("transport-belt", {type="item", name="wood-underground-belt", amount=2})
  Recipe("underground-belt"):replace_ingredient("iron-plate", {type="item", name="transport-belt", amount=2})
  Recipe("splitter"):replace_ingredient("transport-belt", {type="item", name="wood-splitter", amount=1})
  Recipe("splitter"):replace_ingredient("iron-plate", {type="item", name="transport-belt", amount=2})
  Recipe("basic-gear-wheel"):add_unlock("wood-logistics")
  if mods["aai-industry"] then
    Recipe("copper-cable"):remove_unlock("electricity")
    Recipe("copper-cable"):add_unlock("basic-wood-logistics")
  else
    Recipe("transport-belt"):add_unlock("logistics")
    Recipe("copper-cable"):remove_unlock("electronics")
    data.raw.recipe["copper-cable"].enabled = true
  end
end

local rail_cost = settings.startup["wood-logistics-rail-cost"].value
if rail_cost > 0 then
  Recipe("rail"):add_ingredient({type="item", name="wood", amount=rail_cost})
end

if settings.startup["wood-logistics-inserter"].value then
  if mods["aai-industry"] then
    Recipe("inserter"):add_ingredient({type="item", name="basic-gear-wheel", amount=2})
  else
    Recipe("inserter"):replace_ingredient("iron-gear-wheel", {type="item", name="basic-gear-wheel", amount=2})
  end
end

if settings.startup["wood-logistics-assembling-machine"].value then
  Recipe("assembling-machine-1"):replace_ingredient("iron-gear-wheel", "basic-gear-wheel")
  -- if mods["aai-industry"] then
  --   Recipe("assembling-machine-1"):add_ingredient({type="item", name="wood", amount=5})
  -- else
  -- end
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  Recipe("big-electric-pole"):add_ingredient({type="item", name="big-wood-electric-pole", amount=1})
  if mods["big-wooden-pole"] then
    Recipe("big-wooden-pole"):replace_ingredient("wood", "small-electric-pole")
    Recipe("big-wood-electric-pole"):replace_ingredient("small-electric-pole", {type="item", name="big-wooden-pole", amount=2})
  end
end

if mods["big-wooden-pole"] then
  Recipe("big-wooden-pole"):add_unlock("electricity")
end

local repair_pack_cost = settings.startup["wood-logistics-repair-pack-cost"].value
if repair_pack_cost > 0 then
  Recipe("repair-pack"):add_ingredient({type="item", name="wood", amount=repair_pack_cost})
end

if mods["aai-loaders"] and settings.startup["wood-logistics-belts"].value then
  Recipe("aai-loader"):replace_ingredient("transport-belt", "aai-wood-loader")
  data.raw.recipe["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
end

if mods["vanilla-loaders-hd"] and settings.startup["wood-logistics-belts"].value then
  Recipe("loader"):replace_ingredient("iron-gear-wheel", {type="item", name="wood-loader", amount=1})
end
