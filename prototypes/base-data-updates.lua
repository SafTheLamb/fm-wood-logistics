local Item = require("__kry_stdlib__.stdlib.data.item")
local Recipe = require("__kry_stdlib__.stdlib.data.recipe")
local Technology = require("__kry_stdlib__.stdlib.data.technology")


local order_changes = {
  {type="item", name="iron-gear-wheel", order="c[gear-wheel]-b[iron]"},
  {type="item", name="big-electric-pole", order="a[energy]-c[big-electric-pole]c"},
  {type="item", name="small-iron-electric-pole", order="a[energy]-a[small-electric-pole]b"},
  {type="item", name="big-wooden-pole", order="a[energy]-c[big-electric-pole]a"},
  {type="item", name="aai-wood-loader", order="d[loader]-a00[aai-wood-loader]"},
  {type="recipe", name="aai-wood-loader", order="d[loader]-a00[aai-wood-loader]"},
}

for _,c in pairs(order_changes) do
  if data.raw[c.type][c.name] then
    data.raw[c.type][c.name].order = c.order
  end
end

-- TODO: refactor this to iterate over all changes instead of manually coding them all, so that it's easier to see what's being changed
-- name = X, settings = {}, mods = {}, effect = {type=X, ...}

-------------------------------------------------------------------------- Gears
if Item("basic-gear-wheel") then
  if settings.startup["wood-logistics-belts"].value then
    Recipe("basic-gear-wheel"):add_unlock("wood-logistics")
  end
end

if settings.startup["wood-logistics-assembling-machine"].value then
  Recipe("assembling-machine-1"):replace_ingredient("iron-gear-wheel", "basic-gear-wheel")
end

if settings.startup["wood-logistics-inserter"].value then
  if mods["aai-industry"] then
    Recipe("inserter"):add_ingredient({type="item", name="basic-gear-wheel", amount=2})
  else
    Recipe("inserter"):replace_ingredient("iron-gear-wheel", {type="item", name="basic-gear-wheel", amount=2})
  end
end

-------------------------------------------------------------------------- Belts
if settings.startup["wood-logistics-belts"].value then
  if mods["aai-industry"] then
    Recipe("transport-belt"):add_ingredient({type="item", name="wood-transport-belt", amount=2})
  else
    Recipe("transport-belt"):replace_ingredient("iron-plate", {type="item", name="wood-transport-belt", amount=2})
  end
  Recipe("underground-belt"):replace_ingredient("transport-belt", {type="item", name="wood-underground-belt", amount=2})
  Recipe("underground-belt"):replace_ingredient("iron-plate", {type="item", name="transport-belt", amount=2})
  Recipe("splitter"):replace_ingredient("transport-belt", {type="item", name="wood-splitter", amount=1})
  Recipe("splitter"):replace_ingredient("iron-plate", {type="item", name="transport-belt", amount=2})

  Recipe("automation-science-pack"):replace_ingredient("copper-plate", {type="item", name="wood-transport-belt", amount=2})

  Technology("logistics"):add_prereq("wood-logistics")
  if mods["aai-industry"] then
    Recipe("copper-cable"):add_unlock("basic-wood-logistics")
    Technology("basic-logistics"):add_prereq("basic-wood-logistics")
    Technology("automation-science-pack"):add_prereq("basic-wood-logistics")
    Technology("electricity"):add_prereq("wood-logistics")
    Recipe("copper-cable"):remove_unlock("electricity")
  else
    Technology("automation"):add_prereq("wood-logistics")
    Recipe("transport-belt"):add_unlock("logistics")
    Recipe("copper-cable"):remove_unlock("electronics")
    Recipe("copper-cable").enabled = true
  end
end

-------------------------------------------------------------------------- Electric poles
if settings.startup["wood-logistics-big-electric-pole"].value then
  data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "big-electric-pole"
  Recipe("big-electric-pole"):add_ingredient({type="item", name="big-wood-electric-pole", amount=1})
  Technology("electric-energy-distribution-1"):add_prereq("wood-electric-energy-distribution")
  
  if mods["big-wooden-pole"] then
    Recipe("big-wooden-pole"):replace_ingredient("wood", "small-electric-pole")
    Recipe("big-wood-electric-pole"):replace_ingredient("small-electric-pole", {type="item", name="big-wooden-pole", amount=2})
  end
end

if mods["big-wooden-pole"] then
  data.raw["electric-pole"]["big-wooden-pole"].maximum_wire_distance = 16
  
  Recipe("big-wooden-pole"):add_unlock("electricity")
end

if settings.startup["wood-logistics-nerf-small-electric-pole"].value then
  data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance - 1
end

-------------------------------------------------------------------------- Miscellaneous
local rail_cost = settings.startup["wood-logistics-rail-cost"].value
if rail_cost > 0 then
  Recipe("rail"):add_ingredient({type="item", name="wood", amount=rail_cost})
end

local repair_pack_cost = settings.startup["wood-logistics-repair-pack-cost"].value
if repair_pack_cost > 0 then
  Recipe("repair-pack"):add_ingredient({type="item", name="wood", amount=repair_pack_cost})
end

-------------------------------------------------------------------------- Loaders

if mods["aai-loaders"] and settings.startup["wood-logistics-belts"].value then
  table.insert(Recipe("aai-wood-loader").icons, {
    icon = "__wood-logistics__/graphics/icons/aai-wood-loader-overlay.png",
    icon_size = 64
  })
  table.insert(Technology("aai-wood-loader").icons, {
    icon = "__wood-logistics__/graphics/technology/aai-wood-loader-overlay.png",
    icon_size = 256
  })

  Recipe("aai-loader"):replace_ingredient("transport-belt", "aai-wood-loader")
  
  Technology("aai-loader"):add_prereq("aai-wood-loader")
  Technology("aai-loader"):multiply_cost(5)
end

if mods["vanilla-loaders-hd"] and settings.startup["wood-logistics-belts"].value then
  Recipe("loader"):replace_ingredient("iron-gear-wheel", {type="item", name="wood-loader", amount=1})
end

-------------------------------------------------------------------------- Wood R&R
local wood_entities = {
  ["container"] = {"wooden-chest"},
  ["electric-pole"] = {"small-electric-pole", "big-wooden-pole", "big-wood-electric-pole"},
  ["transport-belt"] = {"wood-transport-belt"},
  ["underground-belt"] = {"wood-underground-belt"},
  ["splitter"] = {"wood-splitter"}
}
for typename,list in pairs(wood_entities) do
  for _,entityname in pairs(list) do
    local entity = data.raw[typename][entityname]
    if entity then
      if not entity.resistances then entity.resistances = {} end
      local missing = true
      for _,resistance in pairs(entity.resistances) do
        if resistance.type == "fire" then
          missing = false
          resistance.percent = -90
          break
        end
      end
      if missing then
        table.insert(entity.resistances, {type="fire", percent=-90})
      end
    end
  end
end

if mods["space-age"] then
  for typename,list in pairs(wood_entities) do
    for _,entityname in pairs(list) do
      local entity = data.raw[typename][entityname]
      if entity then
        entity.surface_conditions = {{property="pressure", min=1000, max=2000}}
      end
    end
  end
end
