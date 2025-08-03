-- randomly a price will be possible.
-- the user must loop a certain amount of times
-- to get it 

prize_time = 0

prize_loops = 0

prize_indx = 0
prize_delay = 50
prize_prob = 1
prize_going = false

first_passes = 0
second_passes = 0

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

  -- set a prize indicator thing
  mset(8, 1, 163)
  mset(8, 2, 163)
  mset(8, 3, 163)

  mset(9, 1, 164)
  mset(9, 2, 164)
  mset(9, 3, 164)

end

function update_prizes()
  prize_indx+= 1
  if (prize_indx/ prize_delay) == 1 then
    prize_indx = 0

    if rnd() < prize_prob and not prize_going then
      prize_going = true
      spawn_prize()
      -- todo: different music
    end
  end
end



function draw_prizes()
  local prize_color = 13
  if prize_going then 
    print("prize!!!", 55, 2, prize_color)
    print("loops:" .. prize_loops, 55, 8, prize_color)
    print("first: " .. first_passes .. " second: " .. second_passes, 55, 14, prize_color)
  end
end