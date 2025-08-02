tutorial = {
  i = 1,
  finished = true,
  tutorial_messages = {
    "welcome to fish-loop factory! \n(press \151 to continue, or \n\142 to skip)",
  }
}
function update_tutorial()
  if tutorial.i > #tutorial.tutorial_messages then
    tutorial.finished = true
  end

  if btn(5) then tutorial.i += 1 end

end

function draw_tutorial()
  print(tutorial.tutorial_messages[tutorial.i], 5, 5)
end