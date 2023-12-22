if settings.startup["wood-logistics-small-electric-pole"].value ~= "no" then
  -- if small iron electric poles from AAI Industry also exist, then slightly nerf small (wood) electric poles
  if data.raw["electric-pole"]["small-iron-electric-pole"] then
    data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance =
      data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance - 1
  end
end
