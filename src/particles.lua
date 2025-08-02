-- todo: via circfill, make smoke clouds
-- they will live in a table and randomly
-- get more and more opaque until they 
-- disappear. They will spawn new ones
-- above the old ones

smoke_sprites = {
  134,135,136,137
}

particle_locations = {}

function start_particles(id, x, y)

  -- check if it's already there
  if (particle_locations[id] != nil) return

  particle_locations[id] = {}
  particle_locations[id].i = 0
  particle_locations[id].x = x
  particle_locations[id].y = y
  particle_locations[id].smoke_clouds = {}
  particle_locations[id].smoke_y = y
end

function stop_particles(id)
  particle_locations[id] = nil
end

function update_particles()
  for id, p in pairs(particle_locations) do
    p.i = (p.i + 0.1) % 4

    -- random chance to add smoke
    if rnd() > 0.9 then
      -- note: x should get more spread out
      -- as smoke_y decreases
      local spread = (p.y - p.smoke_y) / 10
      local x = p.x - spread + rnd(2 * spread)
      local y = p.smoke_y
      local size = rnd(2) + spread
      local colors = {4,2,6}
      local color = colors[flr(rnd(#colors)) + 1]
      local filled = rnd() > 0.7
      add(p.smoke_clouds, {x=x, y=y, size=size, color=color, filled=filled})

      p.smoke_y -= rnd(3)
    end
  end

end


function draw_particles()
  for id, particle in pairs(particle_locations) do
    spr(smoke_sprites[flr(particle.i) + 1], particle.x, particle.y)
    for c in all(particle.smoke_clouds) do

      -- keep smoke from going off top of screen
      local cy = max(c.y, 0)
      if (c.filled) then
        circfill(c.x, cy, c.size, c.color)
      else
        circ(c.x, cy, c.size, c.color)
      end
    end
  end
end