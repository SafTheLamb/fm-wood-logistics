local frep = require("__fdsl__.lib.recipe")

-------------------------------------------------------------------------- Item changes

if settings.startup["wood-logistics-belts"].value then
  if mods["aai-loaders"] then
    table.insert(data.raw.item["aai-wood-loader"].icons, {
      icon = "__wood-logistics__/graphics/icons/aai-wood-loader-overlay.png",
      icon_size = 64
    })
    data.raw.item["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
  end
end

if mods["big-wooden-pole"] then
  data.raw.item["big-wooden-pole"].order = "a[energy]-c[big-electric-pole]a"
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  data.raw.item["big-electric-pole"].order = "a[energy]-c[big-electric-pole]c"
end

-------------------------------------------------------------------------- Recipe changes

local wood_item = settings.startup["wood-logistics-lumber"].value and "lumber" or "wood"
if wood_item == "lumber" then
  frep.replace_ingredient("wooden-chest", "wood", "lumber")
  frep.replace_ingredient("small-electric-pole", "wood", "lumber")
  frep.replace_ingredient("combat-shotgun", "wood", "lumber")

  if mods["big-wooden-pole"] then
    frep.replace_ingredient("big-wooden-pole", "wood", "lumber")
  end
end

if settings.startup["wood-logistics-belts"].value then
  if mods["aai-industry"] then
    frep.add_ingredient("transport-belt", {type="item", name="wood-transport-belt", amount=2})
  else
    frep.replace_ingredient("transport-belt", "iron-plate", {type="item", name="wood-transport-belt", amount=2})
  end
  frep.replace_ingredient("underground-belt", "transport-belt", {type="item", name="wood-underground-belt", amount=2})
  frep.replace_ingredient("splitter", "transport-belt", {type="item", name="wood-splitter", amount=1})

  frep.replace_ingredient("automation-science-pack", "copper-plate", {type="item", name="wood-transport-belt", amount=2})

  if mods["aai-loaders"] then
    data.raw.recipe["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
    frep.replace_ingredient("aai-loader", "transport-belt", "aai-wood-loader")
  end
  if mods["vanilla-loaders-hd"] then
    frep.replace_ingredient("loader", "iron-gear-wheel", {type="item", name="wood-loader", amount=1})
  end
end

local rail_cost = settings.startup["wood-logistics-rail-cost"].value
if rail_cost > 0 then
  frep.add_ingredient("rail", {type="item", name=wood_item, amount=rail_cost})
end

if settings.startup["wood-logistics-inserter"].value then
  if mods["aai-industry"] then
    frep.add_ingredient("inserter", {type="item", name=wood_item, amount=1})
    frep.replace_ingredient("long-handed-inserter", "iron-stick", wood_item)
  else
    frep.replace_ingredient("inserter", "iron-plate", wood_item)
    frep.replace_ingredient("long-handed-inserter", "iron-plate", wood_item)
  end
end

if settings.startup["wood-logistics-assembling-machine"].value then
  if mods["aai-industry"] then
    frep.replace_ingredient("assembling-machine-1", "iron-gear-wheel", wood_item)
  else
    frep.replace_ingredient("assembling-machine-1", "iron-plate", wood_item)
  end
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  frep.add_ingredient("big-electric-pole", {type="item", name="big-wood-electric-pole", amount=1})
  if mods["big-wooden-pole"] then
    frep.replace_ingredient("big-wood-electric-pole", "small-electric-pole", "big-wooden-pole")
  end
end

local repair_pack_cost = settings.startup["wood-logistics-repair-pack-cost"].value
if repair_pack_cost > 0 then
  frep.add_ingredient("repair-pack", {type="item", name="wood", amount=repair_pack_cost})
end

-------------------------------------------------------------------------- Entity changes

if settings.startup["wood-logistics-nerf-small-electric-pole"].value then
  data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance - 1
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "big-electric-pole"
end

if mods["big-wooden-pole"] then
  data.raw["electric-pole"]["big-wooden-pole"].maximum_wire_distance = 16
end

local wood_entities = {
  ["container"] = {"wooden-chest"},
  ["electric-pole"] = {"small-electric-pole", "big-wooden-pole", "big-wood-electric-pole"},
  ["transport-belt"] = {"wood-transport-belt"},
  ["underground-belt"] = {"wood-underground-belt"},
  ["splitter"] = {"wood-splitter"}
}

for type,list in pairs(wood_entities) do
  for _,entity_name in pairs(list) do
    local entity = data.raw[type][entity_name]
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
  for type,list in pairs(wood_entities) do
    for _,entity_name in pairs(list) do
      local entity = data.raw[type][entity_name]
      if entity then
        entity.surface_conditions = {{property="pressure", min=1000, max=2000}}
      end
    end
  end
end
