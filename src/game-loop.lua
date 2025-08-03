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
  -- play music for situation (music(0) for normal, music(8) for tense)
  -- stop the music in an if loop to allow the other song to play. stat(57) checks if music is playing currently.
  -- if not stat(57) then
   -- music(0)
  --  music(8)
  -- end

  update_pl()
  update_machines()
  spawn_fish()
  update_particles()
  -- autosell()
  update_shop()
end

function _draw()
  cls()
  draw_map()
  draw_count()
  draw_cash()
  draw_machines()
  draw_pl()
  draw_particles()
  draw_shop()

  if not tutorial.finished then
    draw_tutorial()
  end
  -- temp floor
  --  map(0, 12, 0, 91, 16, 1)
end