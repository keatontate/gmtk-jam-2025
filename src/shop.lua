-- shop for selling fish
-- and possibly buying upgrades

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

  local xoffset = 40
  local yoffset = 20
  rectfill(xoffset, yoffset, 128-xoffset, 128-yoffset, 11)
end