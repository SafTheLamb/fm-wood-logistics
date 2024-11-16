local Technology = require("__kry_stdlib__.stdlib.data.technology")

if settings.startup["wood-logistics-belts"].value then
  Technology("logistics"):add_prereq("wood-logistics")
  if mods["aai-industry"] then
    Technology("basic-logistics"):add_prereq("basic-wood-logistics")
    Technology("automation-science-pack"):add_prereq("basic-wood-logistics")
    Technology("electricity"):add_prereq("wood-logistics")
  else
    Technology("automation"):add_prereq("wood-logistics")
  end
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  Technology("electric-energy-distribution-1"):add_prereq("wood-electric-energy-distribution")
end

if data.raw.technology["aai-wood-loader"] then
  Technology("aai-loader"):add_prereq("aai-wood-loader")
  Technology("aai-loader"):multiply_cost(5)
  table.insert(data.raw.technology["aai-wood-loader"].icons, {
    icon = "__wood-logistics__/graphics/technology/aai-wood-loader-overlay.png",
    icon_size = 256
  })
end
