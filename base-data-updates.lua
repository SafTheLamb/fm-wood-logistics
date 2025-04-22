local frep = require("__fdsl__.lib.recipe")
local fentity = require("__fdsl__.lib.entity")

local lumber_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"

-------------------------------------------------------------------------- Item changes

if settings.startup["wood-logistics-cargo-wagon"].value then
  data.raw["item-with-entity-data"]["cargo-wagon"].order = "c[rolling-stock]-b[cargo-wagon]b"
end

-------------------------------------------------------------------------- Lumber

if lumber_item == "lumber" then
  frep.replace_ingredient("wooden-chest", "wood", "lumber")
  frep.replace_ingredient("small-electric-pole", "wood", "lumber")
  frep.replace_ingredient("combat-shotgun", "wood", "lumber")

  if mods["sign-post"] then
    frep.add_ingredient("sign-post", {type="item", name="lumber", amount=1})
  end
end

-------------------------------------------------------------------------- Carpentry

if settings.startup["wood-logistics-lumber-mill"].value then
  data.raw.recipe["wooden-chest"].category = "crafting-or-carpentry"
  data.raw.recipe["small-electric-pole"].category = "crafting-or-carpentry"
end

if settings.startup["wood-logistics-belts"].value then
  if settings.startup["wood-logistics-belts-modify"].value then
    if mods["aai-industry"] then
      frep.add_ingredient("transport-belt", {type="item", name="wood-transport-belt", amount=1})
    else
      frep.replace_ingredient("transport-belt", "iron-plate", {type="item", name="wood-transport-belt", amount=1})
    end
    frep.modify_result("transport-belt", "transport-belt", {amount=1})
    frep.replace_ingredient("underground-belt", "transport-belt", {type="item", name="wood-underground-belt", amount=2})
    frep.replace_ingredient("splitter", "transport-belt", {type="item", name="wood-splitter", amount=1})
  end

  if not mods["aai-industry"] then
    frep.replace_ingredient("lab", "transport-belt", "inserter")
  end

  if mods["aai-loaders"] and settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
    data.raw.item["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
    data.raw.recipe["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
    if settings.startup["wood-logistics-belts-modify"].value then
      frep.replace_ingredient("aai-loader", "transport-belt", "aai-wood-loader")
    end
  end
  if mods["vanilla-loaders-hd"] then
    if settings.startup["wood-logistics-belts-modify"].value then
      frep.replace_ingredient("loader", "iron-gear-wheel", {type="item", name="wood-loader", amount=1})
    end
  end
end

if settings.startup["wood-logistics-cargo-wagon"].value then
  frep.add_ingredient("cargo-wagon", {type="item", name="wood-cargo-wagon", amount=1})
  if mods["space-age"] then
    frep.replace_ingredient("cargo-wagon", "iron-plate", "tungsten-plate")
  end
end

local rail_cost = settings.startup["wood-logistics-rail-cost"].value
if rail_cost > 0 then
  frep.add_ingredient("rail", {type="item", name=lumber_item, amount=rail_cost})
end

if settings.startup["wood-logistics-inserter"].value then
  if mods["aai-industry"] then
    frep.replace_ingredient("burner-inserter", "iron-stick", {type="item", name=lumber_item, amount=1})
    frep.add_ingredient("inserter", {type="item", name="iron-stick", amount=2})
  else
    frep.replace_ingredient("inserter", "iron-plate", lumber_item)
    frep.replace_ingredient("long-handed-inserter", "iron-plate", lumber_item)
  end
end

if settings.startup["wood-logistics-assembling-machine"].value then
  if mods["aai-industry"] then
    frep.replace_ingredient("burner-assembling-machine", "iron-plate", {type="item", name=lumber_item, amount=4})
  else
    frep.replace_ingredient("assembling-machine-1", "iron-plate", lumber_item)
  end
end

local repair_pack_cost = settings.startup["wood-logistics-repair-pack-cost"].value
if repair_pack_cost > 0 then
  frep.add_ingredient("repair-pack", {type="item", name=lumber_item, amount=repair_pack_cost})
end

-------------------------------------------------------------------------- Entity changes

if settings.startup["wood-logistics-nerf-small-electric-pole"].value then
  data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance - 1
end

if settings.startup["wood-logistics-lumber-mill"].value then
  if mods["space-age"] then
    data.raw["assembling-machine"]["lumber-mill"].heating_energy = "100kW"
  end
  table.insert(data.raw.character.character.crafting_categories, "crafting-or-carpentry")
  table.insert(data.raw["god-controller"].default.crafting_categories, "crafting-or-carpentry")
  table.insert(data.raw["god-controller"].default.crafting_categories, "advanced-crafting-or-carpentry")
  
  if mods["aai-industry"] then
    table.insert(data.raw["assembling-machine"]["burner-assembling-machine"].crafting_categories, "crafting-or-carpentry")
  end
  table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "crafting-or-carpentry")
  table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "crafting-or-carpentry")
  table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "advanced-crafting-or-carpentry")
  table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "crafting-or-carpentry")
  table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "advanced-crafting-or-carpentry")
end

-- Update all wooden entities to be weak to fire and unable to be placed in space or on vulcanus

local wood_entities = {
  ["container"] = {"wooden-chest"},
  ["electric-pole"] = {"small-electric-pole", "big-wooden-pole"},
  ["transport-belt"] = {"wood-transport-belt"},
  ["underground-belt"] = {"wood-underground-belt"},
  ["splitter"] = {"wood-splitter"},
  ["cargo-wagon"] = {"wood-cargo-wagon"},
  ["wall"] = {"wooden-wall"}
}

for entity_type,entity_list in pairs(wood_entities) do
  for _,entity_name in pairs(entity_list) do
    local entity = data.raw[entity_type][entity_name]
    if entity then
      entity.resistances = {{type="fire", percent=-90}}
    end
  end
end

if mods["space-age"] then
  for entity_type,entity_list in pairs(wood_entities) do
    for _,entity_name in pairs(entity_list) do
      fentity.set_surface_condition(entity_type, entity_name, {property="gravity", min=0.1})
      fentity.set_surface_condition(entity_type, entity_name, {property="pressure", max=2000})
    end
  end

  table.insert(data.raw["lightning-attractor"]["fulgoran-ruin-attractor"].minable.results, {type="item", name=lumber_item, amount=10})
  table.insert(data.raw["simple-entity"]["fulgoran-ruin-small"].minable.results, {type="item", name=lumber_item, amount=5})
  table.insert(data.raw["simple-entity"]["fulgoran-ruin-medium"].minable.results, {type="item", name=lumber_item, amount=3})
end
