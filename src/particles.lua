smoke_sprites = {
  134,135,136,137
}

j = 0

particle_locations = {}

function start_particles(id, x, y)
  particle_locations[id] = {}
  particle_locations[id].x = x
  particle_locations[id].y = y
end

function stop_particles(id)
  particle_locations[id] = nil
end

function update_particles()
  j = (j + 0.1) % 4
end


function draw_particles()
  for id, pos in pairs(particle_locations) do
    spr(smoke_sprites[flr(j) + 1], pos.x, pos.y)
  end
end