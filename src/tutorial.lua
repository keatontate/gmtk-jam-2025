tutorial = {
  i = 1,
  finished = false,
  tutorial_messages = {
    "welcome to fish-loop factory! \n(press \151 to continue, or \n\142 to skip)",
    "your goal is to get $".. goal_cash .. " cash. \n(\151)",
    "machines may break! to keep \nyour fish happiness high, \ndon't forget to repair them. \n(\151)",
    "to earn cash, go to the store \n(bottom right) and sell fish. \n(\151)              (DOWN HERE)v",
    "if fish aren't happy enough, \ntheir numbers may decrease! \n(\151)",
    "oh... and one more thing... \n(\151)",
    "you may get lucky and get the \nopportunity to win a prize \nfish. (\151)",
    "these special fishes sell for \na lot more cash! (\151)",
    "to win, just run loops \naround the factory. (\151)",
    "you'll get it... (\151)",
    "good luck! \n(press \151 to start game)"
  }
}
function update_tutorial()
  if tutorial.i > #tutorial.tutorial_messages then
    tutorial.finished = true
  end

  if btnp(5) then 
    tutorial.i += 1 
    sfx(5)
  end
  if btnp(4) then tutorial.i = #tutorial.tutorial_messages + 1 end

end

function draw_tutorial()
  local xoffset = 2
  local yoffset = 80
  local ybuffer = 20
  local rect_color = 6
  local txt_color = 15
  rectfill(xoffset, yoffset, 128-xoffset, 128-ybuffer, rect_color)
  print(tutorial.tutorial_messages[tutorial.i], xoffset + 5, yoffset + 5, txt_color)
end