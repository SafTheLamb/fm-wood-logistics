if mods["space-age"] then
  local wood_entities = -- prototype type -> list[prototype name]
  {
    ["container"] = {"wooden-chest"},
    ["electric-pole"] = {"small-electric-pole", "big-wooden-pole", "big-wood-electric-pole"},
    ["transport-belt"] = {"wood-transport-belt"},
    ["underground-belt"] = {"wood-underground-belt"},
    ["splitter"] = {"wood-splitter"}
  }

  for t,l in pairs(wood_entities) do
    for _,n in pairs(l) do
      if data.raw[t][n] then
        data.raw[t][n].surface_conditions = {{property="pressure", min=1000, max=2000}}
      end
    end
  end
end
