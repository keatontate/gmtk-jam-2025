pl={
  x=63,
  y=63,
  spd=1
  velo = 0,
  grounded = false,
  velo = 0,
  grounded = false,
  spd=1
}

gravity = 0.3
jump = -2.5

-- collision checker
function is_solid(x, y)
    local tile_x = flr(x / 8)
    local tile_y = flr(y / 8)
    local tile = mget(tile_x, tile_y)

    -- temp floor
    return tile == 48
end

gravity = 0.3
jump = -2.5

-- collision checker
function is_solid(x, y)
    local tile_x = flr(x / 8)
    local tile_y = flr(y / 8)
    local tile = mget(tile_x, tile_y)

    -- temp floor
    return tile == 48
end

function update_pl()
 if (btn(0)) pl.x -= pl.spd
 if (btn(1)) pl.x += pl.spd 
 if (btn(2)) pl.y -= pl.spd 
 if (btn(3)) pl.y += pl.spd
end

function draw_pl()
  spr(1,pl.x,pl.y,2,2)
end