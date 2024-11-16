local Recipe = require("__kry_stdlib__.stdlib.data.recipe")
local modutil = require("modutil")

if settings.startup["wood-logistics-belts"].value ~= "no" then
  -- if basic belts exist, update their recipe either way
  if settings.startup["wood-logistics-belts"].value == "item" then
    Recipe("transport-belt"):replace_ingredient("iron-gear-wheel", {type="item", name="wood-transport-belt", amount=2})
    Recipe("underground-belt"):add_ingredient({type="item", name="wood-underground-belt", amount=2})
    Recipe("underground-belt"):remove_ingredient("transport-belt")
    Recipe("splitter"):add_ingredient({type="item", name="wood-splitter", amount=1})
    Recipe("splitter"):remove_ingredient("transport-belt")
    if not modutil.aai_industry then
      Recipe("transport-belt"):add_unlock("logistics")
    end
  else
    Recipe("transport-belt"):add_ingredient({type="item", name="wood", amount=1})
    Recipe("underground-belt"):add_ingredient({type="item", name="wood", amount=4})
    Recipe("splitter"):add_ingredient({type="item", name="wood", amount=8})
  end
end

local rail_cost = settings.startup["wood-logistics-rail-cost"].value
if rail_cost > 0 then
  Recipe("rail"):add_ingredient({type="item", name="wood", amount=rail_cost})
end

if settings.startup["wood-logistics-assembling-machine"].value ~= "no" then
  if settings.startup["wood-logistics-assembling-machine"].value == "vanilla" then
    Recipe("assembling-machine-1"):replace_ingredient("iron-plate", "wood")
  elseif settings.startup["wood-logistics-assembling-machine"].value == "aai" then
    Recipe("assembling-machine-1"):add_ingredient({type="item", name="wood", amount=5})
  else
    Recipe("assembling-machine-1"):replace_ingredient("iron-gear-wheel", "basic-gear-wheel")
  end
end

if settings.startup["wood-logistics-small-electric-pole"].value ~= "no" then
  local small_pole_ingredient = settings.startup["wood-logistics-small-electric-pole"].value == "wood"
    and {type="item", name="wood", amount=2} or {type="item", name="small-electric-pole", amount=1}
  if data.raw.recipe["small-iron-electric-pole"] then
    Recipe("small-iron-electric-pole"):add_ingredient(small_pole_ingredient)
  else
    Recipe("medium-electric-pole"):add_ingredient(small_pole_ingredient)
  end
end

if settings.startup["wood-logistics-big-electric-pole"].value ~= "no" then
  local big_pole_ingredient = settings.startup["wood-logistics-big-electric-pole"].value == "item"
    and {type="item", name="big-wood-electric-pole", amount=1} or {type="item", name="wood", amount=8}
  Recipe("big-electric-pole"):add_ingredient(big_pole_ingredient)
end

local repair_pack_cost = settings.startup["wood-logistics-repair-pack-cost"].value
if repair_pack_cost > 0 then
  Recipe("repair-pack"):add_ingredient({type="item", name="wood", amount=repair_pack_cost})
end

local red_science_cost = settings.startup["wood-logistics-red-science-cost"].value
if red_science_cost > 0 then
  if settings.startup["wood-logistics-red-science-item"].value == "gear" then
    Recipe("automation-science-pack"):replace_ingredient("copper-plate", {type="item", name="basic-gear-wheel", amount=red_science_cost})
  else
    Recipe("automation-science-pack"):add_ingredient({type="item", name="wood", amount=red_science_cost})
  end
end
