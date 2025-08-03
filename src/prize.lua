-- randomly a price will be possible.
-- the user must loop a certain amount of times
-- to get it 

prize_time = 0

prize_loops = 0

prize_indx = 0
prize_delay = 50
prize_prob = 1
prize_going = false

function loop_left()
  prize_loops -= 1/5
end

function loop_right()
  prize_loops += 1/5
end

function spawn_prize()

  -- set a prize indicator thing
  mset(8, 1, 163)
  mset(8, 2, 163)
  mset(8, 3, 163)

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
  end
end