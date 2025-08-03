-- shop for selling fish
-- and possibly buying upgrades

-- note: shop_options need to 
-- correspond to fish_amounts
shop_options = {
  "sell 1 fish",
  "sell 5 fish",
  "sell 10 fish"
}
fish_amounts = {
  1,
  5,
  10
}

shop_i = 1

shop_visible = false

function toggle_shop()
  if (shop_visible) then 
    shop_visible = false
  elseif (not shop_visible) then 
    shop_visible = true
  end
end

function update_shop()
  if (not shop_visible) return

  if (btnp(2)) then 
    shop_i -= 1
    if (shop_i < 1) shop_i = 1
  elseif (btnp(3)) then 
    shop_i += 1
    if (shop_i > #shop_options) shop_i = #shop_options
  end

  -- sell a fish if they click on it
  if (btnp(5)) then
    sell(fish_amounts[shop_i])
    -- note: sfx plays in the sell() function
  end
end


function draw_shop()
  if (not shop_visible) return

  -- draw the rectangle
  local xoffset = 30
  local yoffset = 20
  rectfill(xoffset, yoffset, 128-xoffset, 128-yoffset, 11)
  rect(xoffset, yoffset, 128-xoffset, 128-yoffset, 7)
  rect(xoffset-1, yoffset-1, 128-xoffset+1, 128-yoffset+1, 1)

  -- draw shop opts
  for i=1, #shop_options do 
    local color = 0
    if (i == shop_i) then 
      color = 9
    end
    print(shop_options[i], xoffset + 5, yoffset + 6 * i, color)
  end

  -- hints
  print("\151 to select", xoffset + 5, 128 - yoffset - 16, 0)
  print("\142 to exit", xoffset + 5, 128 - yoffset - 10, 0)
end