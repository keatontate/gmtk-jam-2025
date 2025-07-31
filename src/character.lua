pl={
  x=63,
  y=63,
  spd=1,
  velo = 0,
  grounded = false
}

gravity = 0.3
jump = -2.5

-- collision checker
function is_solid(x, y)
    local tile_x = flr(x / 8)
    local tile_y = flr(y / 8)
    local tile = mget(tile_x, tile_y)

    -- check if the flag is 0
    return fget(tile, 0)
end

function update_pl()
  if (btn(0)) pl.x -= pl.spd
  if (btn(1)) pl.x += pl.spd 

  -- jump
  if (btn(2) and pl.grounded) then
    pl.grounded = false
    pl.velo = jump
  end
 

  -- enables gravity
  if not pl.grounded then
    pl.velo += gravity
  end

  local new_y = pl.y + pl.velo

  -- check if floor is solid
  if is_solid(pl.x + 8, new_y + 15) then
    pl.y = flr((new_y + 15) / 8) * 8 - 16
    pl.velo = 0
    pl.grounded = true
  else
    pl.y = new_y
    pl.grounded = false
  end

end

function draw_pl()
  spr(1,pl.x,pl.y,2,2)
end