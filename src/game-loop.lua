function _init()
  fish_start()
end

function _update()
  update_pl()
  update_machines()
  spawn_fish()
  update_particles()
  autosell()
end

function _draw()
  cls()
  draw_map()
  draw_count()
  draw_machines()
  draw_pl()
  draw_particles()

  -- temp floor
  --  map(0, 12, 0, 91, 16, 1)
end