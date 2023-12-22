local Recipe = require("__stdlib__.stdlib.data.recipe")

if settings.startup["wood-logistics-belts"].value ~= "no" then
  -- if basic belts exist, update their recipe either way
  if settings.startup["wood-logistics-belts"].value == "item" then
    Recipe("transport-belt"):add_unlock("logistics")
    Recipe("transport-belt"):add_ingredient({"wood-transport-belt", 2}, true)
    Recipe("underground-belt"):add_ingredient({"wood-underground-belt", 2}, true)
    Recipe("underground-belt"):remove_ingredient("transport-belt", true)
    Recipe("splitter"):add_ingredient({"wood-splitter", 1}, true)
    Recipe("splitter"):remove_ingredient("transport-belt", true)
  else
    Recipe("transport-belt"):add_ingredient({"wood", 1}, true)
    Recipe("underground-belt"):add_ingredient({"wood", 4}, true)
    Recipe("splitter"):add_ingredient({"wood", 8}, true)
  end
end

local rail_cost = settings.startup["wood-logistics-rail-cost"].value
if rail_cost > 0 then
  Recipe("rail"):add_ingredient({"wood", rail_cost}, true)
end

if settings.startup["wood-logistics-small-electric-pole"].value then
  if data.raw.recipe["small-iron-electric-pole"] then
    Recipe("small-iron-electric-pole"):add_ingredient({"small-electric-pole", 1}, true)
  else
    Recipe("medium-electric-pole"):add_ingredient({"small-electric-pole", 1}, true)
  end
end

local repair_pack_cost = settings.startup["wood-logistics-repair-pack-cost"].value
if repair_pack_cost > 0 then
  Recipe("repair-pack"):add_ingredient({"wood", repair_pack_cost}, true)
end

local red_science_cost = settings.startup["wood-logistics-red-science-cost"].value
if red_science_cost > 0 then
  Recipe("automation-science-pack"):add_ingredient({"wood", red_science_cost})
end
