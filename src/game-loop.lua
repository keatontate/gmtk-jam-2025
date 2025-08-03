function _init()
  fish_start()
  game_over = false
  game_complete = false
  prize_reset()
end

last_track = -1

function _update()

  -- if game_over then 
  --   return 
  -- end 
  print(fish.count, 0, 0, 14)

  -- play music for situation (music(0) for normal, music(8) for tense)
  -- stop the music in an if loop to allow the other song to play. stat(57) checks if music is playing currently.
  
  -- Determine which track to play
  local desired_track

  if prize_going then
    desired_track = 4
  elseif fish.happiness < 7 then
    desired_track = 8
  else
    desired_track = 0
  end

  -- only start music if nothing is playing OR track has changed
  if not stat(57) or desired_track != last_track then
    music(desired_track, 9)
    last_track = desired_track
  end

  -- tutorial goes instead of main loop
  if not tutorial.finished then
    update_tutorial()
    update_pl()
    return
  end
  

  -- game over stuff
  if (fish.count < 2) then 
    game_over = true
  end
  if (cash >= goal_cash) then 
    game_complete = true 
  end 

  update_pl()
  update_machines()
  spawn_fish()
  update_particles()
  -- autosell()
  update_shop()
  update_prizes()
end

function _draw()
  cls()
  draw_map()
  draw_count()
  draw_cash()
  draw_machines()
  draw_pl()
  draw_fish()
  draw_particles()
  draw_shop()
  draw_prizes()

  if not tutorial.finished then
    draw_tutorial()
  end
  

  if game_over then 
    -- draw game over screen
    local xoffset = 15
    local yoffset = 15
    local txt_color = 14
    rectfill(15, 15, 113, 113, 8)
    print("game over, out of fish!", xoffset+5, yoffset+5, txt_color)
    print("to retry, pause and", xoffset+5, yoffset + 11, txt_color)
    print("click reset cart. ", xoffset+5, yoffset + 17, txt_color)
    print("score: " .. cash, xoffset+5, yoffset + 23, txt_color)
  
  elseif game_complete then 
    -- draw game complete screen 
    local xoffset = 15
    local yoffset = 15
    local txt_color = 5
    rectfill(15, 15, 113, 113, 8)
    print("congrats! you got $"..goal_cash.."!", xoffset+5, yoffset+5, txt_color)
    print("to retry, pause and", xoffset+5, yoffset + 11, txt_color)
    print("click reset cart. ", xoffset+5, yoffset + 17, txt_color)
    print("score: " .. cash, xoffset+5, yoffset + 23, txt_color)
  end 
end