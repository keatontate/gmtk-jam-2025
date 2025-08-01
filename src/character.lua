pl={
  x=63,
  y=83,
  spd=1,
  velo = 0,
  grounded = false,
  flip_x = false,
  w = 8,
  h = 16
}

debug_msg = ""

gravity = 0.3
jump = -2.5

function get_tile(x,y)
  -- takes a position and returns
  -- the sprite number on that location
  local tile_x = flr(x / 8)
  local tile_y = flr(y / 8)
  local tile = mget(tile_x, tile_y)
  return tile
end

-- collision checkers
function is_solid(x, y)
  local tile = get_tile(x,y)

  -- check if the flag is 0
  return fget(tile, 0)
end

function is_ladder(x, y)
  local tile = get_tile(x,y)

  -- check if the flag is 1
  return fget(tile, 1)
end

function is_machine(x,y)
  local tile = get_tile(x,y)

  -- check if the flag is 2
  return fget(tile, 2)
end

function update_pl()

  -- ladder turns off gravity
  on_ladder = false
  if is_ladder(pl.x + pl.w/2, pl.y + pl.h) then 
    on_ladder = true
  end

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
  if (btn(0)) and can_move_left then 
    pl.x -= pl.spd
    flip_x = true
  end
  if (btn(1)) and can_move_right then
    pl.x += pl.spd 
    flip_x = false
  end

  -- jump
  if on_ladder then
    if btn(2) then
      pl.y -= pl.spd
    end
    if btn(3) and can_move_down then
      pl.y += pl.spd
    end
  else
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
  

  -- logic for interacting with machines
  if (is_machine(pl.x, pl.y)) then
    debug_msg = "machine"
    if (btn(4)) then 
      debug_msg = "interacting..."
    end
  else
    debug_msg = ""
  end
 

end

function draw_pl()
  -- note: player's actual position 
  -- is at top left corner of sprite
  spr(1,pl.x,pl.y,1,2,flip_x)
  print(debug_msg)
end