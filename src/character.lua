pl={
  x=63,
  y=63,
  spd=1
}

function update_pl()
  if (btn(0)) pl.x -= pl.spd
  if (btn(1)) pl.x += pl.spd 
  if (btn(2)) pl.y -= pl.spd 
  if (btn(3)) pl.y += pl.spd
end

function draw_pl()
  spr(1,pl.x,pl.y,2,2)
end