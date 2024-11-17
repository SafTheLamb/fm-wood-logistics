if data.raw.item["basic-gear-wheel"] then
  data.raw.item["iron-gear-wheel"].order = "c[gear-wheel]-b[iron]"
end

if data.raw.item["big-wood-electric-pole"] then
  data.raw.item["big-electric-pole"].order = "a[energy]-c[big-electric-pole]c"
end

if data.raw.item["aai-wood-loader"] and settings.startup["wood-logistics-belts"].value then
  data.raw.item["aai-wood-loader"].order = "d[loader]-a00[aai-wood-loader]"
  table.insert(data.raw.item["aai-wood-loader"].icons, {
    icon = "__wood-logistics__/graphics/icons/aai-wood-loader-overlay.png",
    icon_size = 64
  })
end

if mods["aai-industry"] then
  data.raw.item["small-iron-electric-pole"].order = "a[energy]-a[small-electric-pole]b"
end

if mods["big-wooden-pole"] then
  data.raw.item["big-wooden-pole"].order = "a[energy]-c[big-electric-pole]a"
end
