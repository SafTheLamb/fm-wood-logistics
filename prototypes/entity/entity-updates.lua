if settings.startup["wood-logistics-nerf-small-electric-pole"].value then
  data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance - 1
end

if mods["big-wooden-pole"] then
  data.raw["electric-pole"]["big-wooden-pole"].maximum_wire_distance = 16
  table.insert(data.raw["electric-pole"]["big-wooden-pole"].resistances, {type="fire", percent=-90})
end

if settings.startup["wood-logistics-big-electric-pole"].value then
  data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "big-electric-pole"
end
