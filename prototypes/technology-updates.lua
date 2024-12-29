local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Technology changes

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

if settings.startup["wood-logistics-lumber-mill"].value then
  if mods["space-age"] then
    ftech.add_prereq("advanced-carpentry", "carbon-fiber")
    ftech.add_cost_ingredient("advanced-carpentry", "space-science-pack")
    ftech.add_cost_ingredient("advanced-carpentry", "agricultural-science-pack")
  end
end

if settings.startup["wood-logistics-cargo-wagon"].value then
  ftech.add_unlock("railway", "wood-cargo-wagon")
  if mods["space-age"] then
    ftech.add_unlock("tungsten-steel", "cargo-wagon")
    ftech.remove_unlock("railway", "cargo-wagon")
  end
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  if mods["aai-industry"] then
    ftech.add_prereq("wood-electric-energy-distribution", "electricity")
  end
  ftech.add_prereq("electric-energy-distribution-1", "wood-electric-energy-distribution")
end

if mods["big-wooden-pole"] then
  if mods["aai-industry"] then
    ftech.add_unlock("electricity", "big-wooden-pole")
  else
    ftech.add_unlock("electronics", "big-wooden-pole")
  end
end

if mods["aai-loaders"] and settings.startup["wood-logistics-belts"].value then
  ftech.add_prereq("aai-loader", "aai-wood-loader")
  ftech.scale_cost("aai-loader", {count=5})
end

-------------------------------------------------------------------------- Miscellaneous compatibility

if mods["apm_power_ldinc"] then
  data.raw.technology["wood-logistics"].hidden = true
  data.raw.technology["wood-logistics"].enabled = false
  data.raw.technology["wood-logistics"].effects = nil
  if mods["aai-industry"] then
    -- ftech.import_unlocks()
    ftech.add_unlock("basic-wood-logistics", "wood-splitter")
    ftech.add_unlock("basic-wood-logistics", "wood-underground-belt")
  else
    -- ftech.disable_technology()
    data.raw.recipe["wood-splitter"].enabled = true
    data.raw.recipe["wood-underground-belt"].enabled = true
  end
end
