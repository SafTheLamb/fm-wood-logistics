local Technology = require("__kry_stdlib__.stdlib.data.technology")
local modutil = require("modutil")

if settings.startup["wood-logistics-belts"].value == "item" then
  Technology("logistics"):add_prereq("wood-logistics")
end

if settings.startup["wood-logistics-big-electric-pole"].value == "item" then
  Technology("electric-energy-distribution-1"):add_prereq("wood-electric-energy-distribution")
end
