local function item_sound(filename, volume)
  return {
    filename = "__wood-logistics__/sound/item/"..filename,
    volume = volume,
    aggregation = {max_count = 1, remove = true},
  }
end

local wood_logistics_item_sounds = {
  wood_transport_belt_inventory_move = item_sound("wood-transport-belt-inventory-move.ogg", 0.7),
  wood_transport_belt_inventory_pickup = item_sound("wood-transport-belt-inventory-pickup.ogg", 0.7),
}

return wood_logistics_item_sounds
