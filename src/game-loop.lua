function _init()
end

function _update()
  update_pl()
  update_machines()
end

function _draw()
  cls()
  draw_map()
  draw_machines()
  draw_pl()

  -- temp floor
  --  map(0, 12, 0, 91, 16, 1)
end