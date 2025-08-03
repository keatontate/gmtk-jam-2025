-- randomly a price will be possible.
-- the user must loop a certain amount of times
-- to get it 

function prize_reset()
  -- reset everything 

  prize_time = 0

  prize_loops = 0

  prize_indx = 0
  prize_delay = 50
  prize_prob = 1
  prize_going = false

  first_passes = 0
  second_passes = 0

  n_loops = 0

  time_left = 0
  dt = 0.02

  mset(8, 1, 170)
  mset(8, 2, 170)
  mset(8, 3, 170)
  mset(9, 1, 170)
  mset(9, 2, 170)
  mset(9, 3, 170)

  sfx(-1, 69)
end 

function passed_first()
  if (second_passes - first_passes) == 1 then 
    -- wrong direction 
    prize_loops -= 1
    -- reset everything
    first_passes = 0
    second_passes = 0
  else 
    second_passes = 0
    first_passes = 1
  end 
end

function passed_second()
  if (first_passes - second_passes) == 1 then 
    -- correct direction 
    prize_loops += 1
    -- reset everything
    first_passes = 0
    second_passes = 0
  else 
    second_passes = 1
    first_passes = 0
  end 
end

function reset_loop_indicator()
  first_passes = 0
  second_passes = 0
end

function spawn_prize()

  -- timer tick
  sfx(8, 69)

  -- temp
  if rnd() > 0.5 then 
    n_loops = 1
  else 
    n_loops = 2
  end

  time_left = n_loops * 6

  -- set a prize indicator thing
  if rnd() > 0.5 then 
    mset(8, 1, 163)
    mset(8, 2, 163)
    mset(8, 3, 163)

    mset(9, 1, 164)
    mset(9, 2, 164)
    mset(9, 3, 164)

  else 
    mset(8, 1, 166)
    mset(8, 2, 166)
    mset(8, 3, 166)

    mset(9, 1, 165)
    mset(9, 2, 165)
    mset(9, 3, 165)
  end

end

function update_prizes()

  if prize_going then 
    time_left -= dt 
    if (time_left <= 0) then 
      prize_reset()
    end 
  end 

  if prize_going and (n_loops == prize_loops) then 
    give_prize()
  end 
    

  if (not prize_going) prize_indx+= 1
  if (prize_indx/ prize_delay) == 1 then
    prize_indx = 0

    if rnd() < prize_prob and not prize_going then
      prize_going = true
      spawn_prize()
      -- todo: different music
    end
  end
end


function give_prize()
  -- give cash
  -- note access of cash.lua variables
  special_fish_count += 1
  fish_worth = 20
  prize_reset()
  -- note access of fish.lua stuff
  -- (it's 1:59 the night before this is due,
  -- it's getting unhinged)

  local special_fsh_sprites = {
    156, 157,
    172, 173,
    188, 189
  }

  local special_sprite = special_fsh_sprites[flr(rnd(#special_fsh_sprites)+1)]

  add(fish_sprites, {
    sprite = special_sprite,
    x = 63 - (fish_spread/2) + rnd(fish_spread),
    y = 63 - (fish_spread/2) + rnd(fish_spread)
  })

  -- sfx
  sfx(4)
end



function draw_prizes()
  local prize_color = 6
  local xoffset = 45
  local yoffset = 45
  if prize_going then 
    print("loop ".. n_loops .. " \ntimes for \na prize!", xoffset, yoffset, prize_color)
    print("loops:" .. prize_loops.. " \ntime: ".. time_left, xoffset, yoffset + 18, prize_color)
  end
end