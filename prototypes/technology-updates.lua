local Technology = require("__stdlib__.stdlib.data.technology")
local modutil = require("modutil")

if settings.startup["wood-logistics-belts"].value == "item" then
  if modutil.aai_industry then
    Technology("logistics"):add_prereq("wood-logistics")
  else
    Technology("basic-logistics"):add_prereq("wood-logistics")
  end
end
