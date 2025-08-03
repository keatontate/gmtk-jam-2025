tutorial = {
  i = 1,
  finished = false,
  tutorial_messages = {
    "welcome to fish-loop factory! \n(press \151 to continue, or \n\142 to skip)",
    "your goal is to get $".. goal_cash .. " cash. (\151)",
    "machines may break! to keep \nyour fish happiness high, \ndon't forget to repair them. \n(\151)",
    "to earn cash, go to the store \n(bottom right) and sell fish. (\151)",
    "if fish aren't happy enough, \ntheir numbers may decrease! (\151)",
    "good luck! \n(press \151 to start game)"
  }
}
function update_tutorial()
  if tutorial.i > #tutorial.tutorial_messages then
    tutorial.finished = true
  end

  if btnp(5) then tutorial.i += 1 end
  if btnp(4) then tutorial.i = #tutorial.tutorial_messages + 1 end

end

function draw_tutorial()
  print(tutorial.tutorial_messages[tutorial.i], 5, 5)
end