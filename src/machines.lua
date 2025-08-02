-- Manages the state of machines
-- Done: machines breaking (increase delay)
-- TODO: deterministic machine refilling

poop_machine = {
  sprites = {73,41,57,52},
  broken=false,
  break_prob = 0.1,
  x = 15,
  y = 100
}

temp_machine = {
  sprites = {59,75},
  broken = false,
  break_prob = 0.2,
  x = 6,
  y = 10
}

oxyg_machine = {
  sprites = {99,100,115,116,131},
  broken = false,
  break_prob = 0.09,
  x = 25,
  y = 39
}

food_machine = {
  sprites = {28,44},
  broken = false,
  break_prob = 0.2,
  x = 118,
  y = 33
}

machines = {
  poop_machine,
  temp_machine,
  oxyg_machine,
  food_machine
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
  for mach in all(machines) do 
    if contains(mach.sprites, sprite_number) then
      mach.broken = false
      stop_particles(mach)
    end
  end
end

function broke_count()
    local broke = 0
    for mach in all(machines) do
        if mach.broken then
            broke += 1
        end
    end
    return broke
end


function update_machines()
  i += 1
  if (i / time_delay) == 1 then
    i = 0

    -- todo: if it's already broken,
    -- instead of breaking it again,
    -- reduce fish happiness
    for mach in all(machines) do 
      if rnd() < mach.break_prob then
        mach.broken = true
        start_particles(mach, mach.x, mach.y)
      end
    end
  end
end


function draw_machines()

end