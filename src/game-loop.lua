function _init()
  fish_start()
end

function _update()
  update_pl()
  spawn_fish()
end

function _draw()
 cls()
 draw_map()
 draw_count()
 draw_pl()
 

 -- temp floor
--  map(0, 12, 0, 91, 16, 1)
end