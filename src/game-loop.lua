function _init()
  fish_start()
  game_over = false
end

function _update()

  -- if game_over then 
  --   return 
  -- end 
  print(fish.count, 0, 0, 14)


  -- tutorial goes instead of main loop
  if not tutorial.finished then
    update_tutorial()
    update_pl()
    return
  end
  -- play music for situation (music(0) for normal, music(8) for tense)
  -- stop the music in an if loop to allow the other song to play. stat(57) checks if music is playing currently.
  if not stat(57) then
    if (fish.happiness > 0.5) then 
      music(0)
    else 
      music(8)
    end
  end

  -- game over stuff
  if (fish.count < 2) then 
    game_over = true
  end

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
  

  if game_over then 
    -- draw game over screen
    local xoffset = 15
    local yoffset = 15
    rectfill(15, 15, 113, 113, 8)
    print("game over, out of fish!", xoffset+5, yoffset+5, 14)
    print("to retry, pause and", xoffset+5, yoffset + 11, 14)
    print("click reset cart. ", xoffset+5, yoffset + 17, 14)
    print("score: " .. cash, xoffset+5, yoffset + 23, 14)
  end 
end