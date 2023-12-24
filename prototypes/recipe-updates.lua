local Recipe = require("__stdlib__.stdlib.data.recipe")
local modutil = require("modutil")

if settings.startup["wood-logistics-belts"].value ~= "no" then
  -- if basic belts exist, update their recipe either way
  if settings.startup["wood-logistics-belts"].value == "item" then
    Recipe("transport-belt"):add_ingredient({"wood-transport-belt", 2}, true)
    Recipe("underground-belt"):add_ingredient({"wood-underground-belt", 2}, true)
    Recipe("underground-belt"):remove_ingredient("transport-belt", true)
    Recipe("splitter"):add_ingredient({"wood-splitter", 1}, true)
    Recipe("splitter"):remove_ingredient("transport-belt", true)
    if not modutil.aai_industry then
      Recipe("transport-belt"):add_unlock("logistics")
    end
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

if settings.startup["wood-logistics-assembling-machine"].value ~= "no" then
  if settings.startup["wood-logistics-assembling-machine"].value == "wood" then
    
  end
end

if settings.startup["wood-logistics-small-electric-pole"].value ~= "no" then
  local small_pole_ingredient = settings.startup["wood-logistics-small-electric-pole"].value == "wood"
    and {"wood", 2} or {"small-electric-pole", 1}
  if data.raw.recipe["small-iron-electric-pole"] then
    Recipe("small-iron-electric-pole"):add_ingredient(small_pole_ingredient, true)
  else
    Recipe("medium-electric-pole"):add_ingredient(small_pole_ingredient, true)
  end
end

if settings.startup["wood-logistics-big-electric-pole"].value ~= "no" then
  local big_pole_ingredient = settings.startup["wood-logistics-big-electric-pole"].value == "item"
    and {"big-wood-electric-pole", 1} or {"wood", 8}
  Recipe("big-electric-pole"):add_ingredient(big_pole_ingredient, true)
end

local repair_pack_cost = settings.startup["wood-logistics-repair-pack-cost"].value
if repair_pack_cost > 0 then
  Recipe("repair-pack"):add_ingredient({"wood", repair_pack_cost}, true)
end

local red_science_cost = settings.startup["wood-logistics-red-science-cost"].value
if red_science_cost > 0 then
  if settings.startup["wood-logistics-red-science-item"].value == "basic-gear-wheel" then
    Recipe("automation-science-pack"):replace_ingredient("copper-plate", {"basic-gear-wheel", red_science_cost}, true)
  else
    Recipe("automation-science-pack"):add_ingredient({"wood", red_science_cost}, true)
  end
end
