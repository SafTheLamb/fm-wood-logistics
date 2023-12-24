if data.raw.item["basic-gear-wheel"] then
  data.raw.item["iron-gear-wheel"].order = "c[gear-wheel]-b[iron]"
end

if data.raw.item["big-wood-electric-pole"] then
  data.raw.item["big-electric-pole"].order = "a[energy]-c[big-electric-pole]b"
end
