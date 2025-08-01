pl={
  x=63,
  y=63,
  spd=1,
  velo = 0,
  grounded = false,
  w = 16,
  h = 16
}

gravity = 0.3
jump = -2.5

-- collision checkers
function is_solid(x, y)
  local tile_x = flr(x / 8)
  local tile_y = flr(y / 8)
  local tile = mget(tile_x, tile_y)

  -- check if the flag is 0
  return fget(tile, 0)
end

function update_pl()

  -- check collissions
  can_move_down = true
  can_move_left = true
  can_move_right = true
  can_move_up = true

  -- buffer gives the player a little
  -- wiggle room and makes the game
  -- feel less choppy
  buffer = 2

  if is_solid(pl.x + pl.w/2, pl.y + pl.h) then
    can_move_down = false
  end
  if is_solid(pl.x, pl.y + pl.h - buffer) then
    can_move_left = false
  end
  if is_solid(pl.x + pl.w, pl.y + pl.h - buffer) then
    can_move_right = false
  end
  if is_solid(pl.x + pl.w/2, pl.y - buffer) then
    can_move_up = false
  end


  -- movement logic
  if (btn(0)) and can_move_left pl.x -= pl.spd
  if (btn(1)) and can_move_right pl.x += pl.spd 

  -- jump
  if (btn(2) and pl.grounded and can_move_up) then
    pl.grounded = false
    pl.velo = jump
  end
 
  -- enables gravity
  if not pl.grounded then
    pl.velo += gravity
  end

  local new_y = pl.y + pl.velo

  -- update player y based on vel
  if can_move_down then
    pl.y = new_y
    pl.grounded = false
  else
    pl.y = flr((new_y + pl.h) / 8) * 8 - 16
    pl.velo = 0
    pl.grounded = true
  end

end

function draw_pl()
  -- note: player's actual position 
  -- is at top left corner of sprite
  spr(1,pl.x,pl.y,2,2)
end