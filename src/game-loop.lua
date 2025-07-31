function _init()
    for x = 0, 15 do
        mset(x, 12, 48)
    end
end

function _update()
<<<<<<< Updated upstream
  update_pl()
end

function _draw()
  cls()
  draw_pl()
  -- circfill(64,64,5,7)
  -- if btn(2) then
  --  circfill(64,64,10,6)
  -- end
=======
 update_pl()


end

function _draw()
 cls()
 draw_pl()
 -- temp floor
 map(0, 12, 0, 91, 16, 1)

>>>>>>> Stashed changes
end