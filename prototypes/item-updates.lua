if data.raw.item["basic-gear-wheel"] then
  data.raw.item["iron-gear-wheel"].order = "c[gear-wheel]-b[iron]"
end

if data.raw.item["big-wood-electric-pole"] then
  data.raw.item["big-electric-pole"].order = "a[energy]-c[big-electric-pole]b"
end

if data.raw.item["aai-wood-loader"] then
  table.insert(data.raw.item["aai-wood-loader"].icons, {
    icon = "__wood-logistics__/graphics/icons/aai-wood-loader-overlay.png",
    icon_size = 64
  })
end
