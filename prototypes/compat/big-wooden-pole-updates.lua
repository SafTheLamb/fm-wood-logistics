local frep = require("__fdsl__.lib.recipe")

if mods["big-wooden-pole"] then
  data.raw.item["big-wooden-pole"].order = "a[energy]-c[big-electric-pole]a"

  if settings.startup["wood-logistics-lumber"].value then
    frep.replace_ingredient("big-wooden-pole", "wood", "lumber")
  end

  if settings.startup["wood-logistics-lumber-mill"].value then
    data.raw.recipe["big-wooden-pole"].category = "crafting-or-carpentry"
  end
end
