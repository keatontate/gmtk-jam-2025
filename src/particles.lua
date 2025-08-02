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
  particle_locations[id] = {}
  particle_locations[id].i = 0
  particle_locations[id].x = x
  particle_locations[id].y = y
  particle_locations[id].smoke_clouds = {}
  particle_locations[id].smoke_y = y - 10
end

function stop_particles(id)
  particle_locations[id] = nil
end

function update_particles()
  for id, p in pairs(particle_locations) do
    p.i = (p.i + 0.1) % 4

    -- random chance to add smoke
    if rnd() > 0.9 then
      -- circfill()
    end
  end

end


function draw_particles()
  for id, particle in pairs(particle_locations) do
    spr(smoke_sprites[flr(particle.i) + 1], particle.x, particle.y)
  end
end