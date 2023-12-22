local Technology = require("__stdlib__.stdlib.data.technology")

if settings.startup["wood-logistics-belts"].value == "item" then
  Technology("logistics"):add_prereq("wood-logistics")
end
