-- Manages the state of machines

poop_machine = {
  sprites = {28,44},
  broken=false
}

i = 0

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
  
  
end


function update_machines()
  i += 1
  if (i / 100) == 1 then
    i = 0
    poop_machine.broken = true
  end

end


function draw_machines()
  print(i/10)
  print(poop_machine.broken)

end