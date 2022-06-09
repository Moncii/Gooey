
Input = require 'Libs/input'
ui = require 'UI/ui'

love.load = function()

   Input.bind_callbacks()
   love.window.setMode(1280, 720)

   ui.init()

   local testPanel = ui.window.new()
   ui.text.new(testPanel, {
      text = "Hello UI World!",
   })
   ui.text.new(testPanel, {
      align = "center",
      text = "Some more text!!! How strange? Yes indeed. Hmm",
   })
   ui.text.new(testPanel, {
      text = "Third Line of Text?",
   })

   ui.button.new(testPanel, {
      align = "center",
      action = function()
         print("Pressed!")
      end
   })

   ui.checkbox.new(testPanel, {
      align = "left",
      action = {
         checked = function()
            print("Checked!")
         end,
      },
   })

   local testWindow = ui.window.new({
      title = "Test Window",
      x = 300, y = 300,
   })

   ui.text.new(testWindow, {
      text = "Wow! A window!",
   })
   ui.button.new(testWindow, {
      align = "center",
   })

end

love.update = function(dt)

   ui.update()

   local keys = Input.get_down_keys()
   local keys_info = Input.get_history(2)

end

love.draw = function()

   ui.draw()

end
