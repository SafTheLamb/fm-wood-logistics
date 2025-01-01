local ftech = require("__fdsl__.lib.technology")
local frep = require("__fdsl__.lib.recipe")

-- the fix for apm needs to be here... for some reason
if mods["apm_power_ldinc"] and settings.startup["wood-logistics-belts"].value then
  data.raw.technology["wood-logistics"].hidden = true
  data.raw.technology["wood-logistics"].enabled = false
  ftech.remove_prereq("logistics", "wood-logistics")
  data.raw.technology["basic-wood-logistics"].localised_name = {"technology-name.wood-logistics"}
  
  if mods["aai-loaders"] and settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
    ftech.add_prereq("aai-wood-loader", "apm_steam_science_pack")
    ftech.remove_cost_ingredient("aai-wood-loader", "automation-science-pack")
    ftech.remove_prereq("aai-wood-loader", "wood-logistics")
    ftech.remove_prereq("aai-wood-loader", "automation-science-pack")
    if mods["aai-industry"] then
      ftech.add_prereq("aai-wood-loader", "basic-wood-logistics")
      ftech.remove_cost_ingredient("aai-wood-loader", "logistic-science-pack")
      ftech.remove_prereq("aai-wood-loader", "steam-power")
    end

    ftech.remove_cost_ingredient("aai-loader", "logistic-science-pack")
    ftech.remove_prereq("aai-loader", "logistic-science-pack")
    if settings.startup["aai-loaders-mode"].value == "lubricated" then
      frep.replace_ingredient("aai-wood-loader", "apm_simple_engine", "apm_steam_engine")
      ftech.remove_prereq("aai-loader", "oil-processing")
    end
  end
  
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
