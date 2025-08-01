pl={
  x=63,
  y=83,
  spd=1.5,
  velo = 0,
  grounded = false,
  flip_x = false,
  actively_climbing=false,
  w = 8,
  h = 8
}

debug_msg = ""
player_msg = ""

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

function is_shop(x,y)
  local tile = get_tile(x,y)

  -- check if the flag is 3
  return fget(tile, 3)
end

function update_pl()
  -- turn of sound playing for ladder noises
  playing_sound = false

  -- ladder turns off gravity
  on_ladder = false
  if is_ladder(pl.x + pl.w/2, pl.y + pl.h) then 
    on_ladder = true
    pl.grounded = true
    pl.velo = 0
  end

  -- check collisions
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
  -- extra 'can_move_down' check
  -- (with buffer) to prevent 
  -- fall through floor glitch
  if is_solid(pl.x + pl.w/2, pl.y + pl.h - buffer) then
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
      pl.y -= pl.spd / 2

      -- ladder sound effects
      -- note: uses channel 1 (same as flag)
      if not pl.actively_climbing then 
        pl.actively_climbing = true
        sfx(9,1)
      end 
    elseif btn(3) and can_move_down then
      pl.y += pl.spd / 2
      if not pl.actively_climbing then 
        pl.actively_climbing = true
        sfx(9,1)
      end 
    else
      if pl.actively_climbing then 
        pl.actively_climbing = false
        sfx(-1,1)
      end 
    end
    
  else
    -- ensure no ladder sounds while not on ladder
    sfx(-1,1)
    actively_climbing = false
    if (btn(2) and pl.grounded and can_move_up) then
      pl.grounded = false
      pl.velo = jump
      sfx(3)
    end

    -- enables gravity
    if not pl.grounded then
      pl.velo += gravity
      if pl.velo > 5 then -- caps velocity, preventing clipping
        pl.velo = 3
      end
    end

    local new_y = pl.y + pl.velo

    -- update player y based on vel
    if can_move_down then
      pl.y = new_y
      pl.grounded = false
    else
      pl.y = flr((new_y + pl.h) / 8) * 8 - pl.h
      pl.velo = 0
      pl.grounded = true
    end
  end
  

  -- logic for interacting with machines
  local playerx1 = pl.x
  local playerx2 = pl.x+pl.w
  local playery = pl.y + pl.h - buffer
  if is_machine(playerx1, playery)
  or is_machine(playerx2, playery) then
    debug_msg = "machine"
    player_msg = "\142/\151"
    if (btn(4) or btn(5)) then 
      debug_msg = "interacting..."
      player_msg = ""
      
      fix_machine(get_tile(playerx1, playery))
      fix_machine(get_tile(playerx2, playery))

    end
  else
    debug_msg = ""
    player_msg = ""
  end

  -- logic for shop:
  if is_shop(playerx1, playery)
  or is_shop(playerx2, playery) then
    player_msg = "\142/\151"
    if (btn(4) or btn(5)) then 
      player_msg = "shop"
      
      -- fix_machine(get_tile(playerx1, playery))
      -- fix_machine(get_tile(playerx2, playery))
    end
  else
    debug_msg = ""
    player_msg = ""
  end

  -- keep character on screen
  if (pl.x > 128 - pl.w) pl.x = 128 - pl.w
  if (pl.x < 0) pl.x = 0
  -- respawn if they fall off
  if (pl.y > 128) pl.y = 83


  -- temp sell
  if (btn(4) and btn(5)) then
    sell(1)
  end

end

function draw_pl()
  -- note: player's actual position 
  -- is at top left corner of sprite
  spr(1,pl.x,pl.y - (pl.h) ,1,2,flip_x)
  print(player_msg, pl.x - (#player_msg), pl.y - 10, 15)
end