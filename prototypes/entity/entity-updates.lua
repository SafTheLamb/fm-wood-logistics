if settings.startup["wood-logistics-small-electric-pole"].value ~= "no" then
  -- if small iron electric poles from AAI Industry also exist, then slightly nerf small (wood) electric poles
  if data.raw["electric-pole"]["small-iron-electric-pole"] then
    data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance =
      data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance - 1
  end
end

if settings.startup["wood-logistics-big-electric-pole"].value == "item" then
  data.raw["electric-pole"]["big-electric-pole"].fast_replaceable_group = "big-electric-pole"
end
