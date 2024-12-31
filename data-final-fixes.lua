local ftech = require("__fdsl__.lib.technology")

-- the fix for apm needs to be here... for some reason
if mods["apm_power_ldinc"] and settings.startup["wood-logistics-belts"].value then
  data.raw.technology["wood-logistics"].hidden = true
  data.raw.technology["wood-logistics"].enabled = false
  ftech.remove_prereq("logistics", "wood-logistics")
  
  data.raw.technology["wood-logistics"].effects = nil
  if mods["aai-industry"] then
    -- ftech.import_unlocks()
    ftech.add_unlock("basic-wood-logistics", "wood-splitter")
    ftech.add_unlock("basic-wood-logistics", "wood-underground-belt")
    data.raw.technology["basic-wood-logistics"].research_trigger = {
      type = "craft-item",
      item = "copper-plate",
      count = 10,
    }
    ftech.add_unlock("basic-wood-logistics", "copper-cable")
  else
    -- ftech.disable_technology()
    data.raw.recipe["wood-splitter"].enabled = true
    data.raw.recipe["wood-underground-belt"].enabled = true
  end
end
