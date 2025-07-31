function _init()
    for x = 0, 15 do
        mset(x, 12, 48)
    end
end

function _update()
  update_pl()
end

function _draw()
 cls()
 draw_map()
 draw_pl()

 -- temp floor
--  map(0, 12, 0, 91, 16, 1)
end