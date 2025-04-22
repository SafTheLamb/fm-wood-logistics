local frep = require("__fdsl__.lib.recipe")

if mods["Wood-Walls"] and settings.startup["wood-logistics-lumber"].value then
  data.raw.tile["wood-floor"].minable.result = "lumber"
  data.raw.item["lumber"].place_as_tile = data.raw.item["wood"].place_as_tile
  data.raw.item["wood"].place_as_tile = nil
  
  if mods["Wood-Walls"] then
    frep.replace_ingredient("wooden-wall", "wood", "lumber")
  end
end
