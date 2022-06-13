
class = require "Gooey/Libs/clascii"
Input = require 'Gooey/Libs/input'

ui = {

   theme = require 'Gooey/theme',
   panel = require 'Gooey/Elements/panel',
   text = require 'Gooey/Elements/text',
   button = require 'Gooey/Elements/button',
   checkbox = require 'Gooey/Elements/checkbox',
   window = require 'Gooey/Elements/window',

   init = function()

      Input.bind_callbacks()
      love.graphics.setFont(ui.theme.font)

      ui.theme.icons['checkmark'] = love.graphics.newQuad(0, 0, 48, 48, ui.theme.iconSource:getDimensions())

   end,

   update = function(dt)

      local keys = Input.get_down_keys()
      local keys_info = Input.get_history(2)

   end,

   draw = function()



   end,

   mouseInPoint = function(x, y, w, h)

      local mx, my = love.mouse.getX(), love.mouse.getY()

      if(mx >= x) and (mx <= x+w) then
         if(my >= y) and (my <= y+h) then
            return true
         end
      end

      return false

   end,

}

return ui
