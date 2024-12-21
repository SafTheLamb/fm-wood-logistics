-- This needs to happen in data-updates because AAI Industry changes technologies in updates
require("prototypes.technology-updates")

if mods["Wood-Walls"] and settings.startup["wood-logistics-lumber"].value then
  data.raw.tile["wood-floor"].minable.result = "lumber"
  data.raw.item["lumber"].place_as_tile = data.raw.item["wood"].place_as_tile
  data.raw.item["wood"].place_as_tile = nil
end
