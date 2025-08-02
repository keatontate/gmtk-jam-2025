smoke_sprites = {
  134,135,136,137
}

j = 0

function update_particles()
  j = (j + 0.1) % 4
end


function draw_particles()
  spr(smoke_sprites[flr(j) + 1], 63, 63)
end