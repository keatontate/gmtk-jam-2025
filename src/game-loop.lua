function _init()
  fish_start()
end

function _update()
  -- tutorial goes instead of main loop
  if not tutorial.finished then
    update_tutorial()
    update_pl()
    return
  end
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

  if not tutorial.finished then
    draw_tutorial()
  end
  -- temp floor
  --  map(0, 12, 0, 91, 16, 1)
end