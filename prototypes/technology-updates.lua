local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Transport belts

if settings.startup["wood-logistics-belts"].value then
  ftech.add_prereq("logistics", "wood-logistics")
  data.raw.recipe["copper-cable"].enabled = true
  if mods["aai-industry"] then
    ftech.add_prereq("basic-logistics", "basic-wood-logistics")
    ftech.add_prereq("automation-science-pack", "basic-wood-logistics")
    ftech.remove_unlock("electricity", "copper-cable")
  else
    ftech.add_unlock("logistics", "transport-belt")
    ftech.remove_unlock("electronics", "copper-cable")
  end
end

-------------------------------------------------------------------------- Lumber mill

if settings.startup["wood-logistics-lumber-mill"].value then
  if mods["space-age"] then
    ftech.add_prereq("advanced-carpentry", "carbon-fiber")
    ftech.add_cost_ingredient("advanced-carpentry", "space-science-pack")
    ftech.add_cost_ingredient("advanced-carpentry", "agricultural-science-pack")
  end
end

-------------------------------------------------------------------------- Cargo wagon

if settings.startup["wood-logistics-cargo-wagon"].value then
  ftech.add_unlock("railway", "wood-cargo-wagon")
  if mods["space-age"] then
    ftech.add_unlock("tungsten-steel", "cargo-wagon")
    ftech.remove_unlock("railway", "cargo-wagon")
  end
end

-------------------------------------------------------------------------- Big wooden pole

if mods["big-wooden-pole"] then
  if mods["aai-industry"] then
    ftech.add_unlock("electricity", "big-wooden-pole")
  else
    ftech.add_unlock("electronics", "big-wooden-pole")
  end
end

if mods["aai-loaders"] and settings.startup["wood-logistics-belts"].value and settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
  ftech.add_prereq("aai-loader", "aai-wood-loader")
  ftech.scale_cost("aai-loader", {count=5})
end

if settings.startup["wood-logistics-woodtronics"].value then
  ftech.add_unlock("electronics", "electronic-circuit-from-wood")
end
