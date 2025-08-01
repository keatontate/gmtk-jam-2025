function draw_map()
  -- set background color
  cls(1)
  -- draw background supports
  -- -- purple shadows
  rectfill(52,63,104,95,6)
  rectfill(104,56,127,79,6)
  rectfill(0,69,13,95,6)
  rectfill(0,90,31,127,6)
  -- -- struts
  line(0,66,52,95,6)
  line(0,65,52,95,6)
  line(0,101,55,69,6)
  line(0,100,55,68,6)


  -- draw map tiles
  map()
  -- draw tank
  circfill(63,64,31,0)
  circfill(63,64,26,2)
  -- draw supports
  spr(64,56,96,4,2)

  -- -- decorative panels
  -- fillp(0b0011010101101000)
  rectfill(106,62,126,75,1)
  rectfill(60,114,93,124,1)
  -- fillp()
  
  -- draw status screens, text goes here later
  -- -- general
  rectfill(10,4,56,25,6)
  rectfill(11,5,55,24,11)
  -- -- for fish count
  rectfill(81,33,101,44,6)
  rectfill(82,34,100,43,11)

  -- below stuff gets called in draw function
  -- draw top layer sprites/fish
  --(put in draw function)
  -- draw cracked tank leak
end