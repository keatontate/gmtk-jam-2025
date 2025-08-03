-- shop for selling fish
-- and possibly buying upgrades

shop_options = {
  "sell 1 fish",
  "sell 5 fish",
  "sell 10 fish"
}

shop_visible = false

function toggle_shop()
  if (shop_visible) then 
    shop_visible = false
  elseif (not shop_visible) then 
    shop_visible = true
  end
end

function update_shop()
  
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
    print(shop_options[i], xoffset + 5, yoffset + 6 * i)
  end
end