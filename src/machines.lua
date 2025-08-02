-- Manages the state of machines

poop_machine = {
  sprites = {28,44},
  broken=false,
  break_prob = 0.5
}

temp_machine = {
  sprites = {59,75},
  broken = false,
  break_prob = 0.2
}

i = 0
time_delay = 100

function contains(t, val)
  for v in all(t) do
    if v == val then return true end
  end
  return false
end


function fix_machine(sprite_number)
  -- input: sprite number from mget() function

  -- get which machine it is
  if contains(poop_machine.sprites, sprite_number) then
    poop_machine.broken = false
  end

  if contains(temp_machine.sprites, sprite_number) then
    temp_machine.broken = false
  end
  
  
end


function update_machines()
  i += 1
  if (i / time_delay) == 1 then
    i = 0

    -- todo: if it's already broken,
    -- instead of breaking it again,
    -- reduce fish happiness
    if rnd() < poop_machine.break_prob then
      poop_machine.broken = true
    end
    if rnd() < temp_machine.break_prob then 
      temp_machine.broken = true
    end
  end

end


function draw_machines()
  print("poop machine broken:" .. tostr(poop_machine.broken) .. i/time_delay, 0, 0, 3)
  print("temp machine broken:" .. tostr(temp_machine.broken) .. i/time_delay, 0, 10, 3)

end