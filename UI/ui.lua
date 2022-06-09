
ui = {

   theme = require 'UI/theme',
   panel = require 'UI/panel',
   text = require 'UI/text',
   button = require 'UI/button',
   checkbox = require 'UI/checkbox',
   window = require 'UI/window',

   panels = {},
   windows = {},

   init = function()

      love.graphics.setFont(ui.theme.font)

      ui.theme.icons['checkmark'] = love.graphics.newQuad(0, 0, 48, 48, ui.theme.iconSource:getDimensions())

   end,

   update = function(dt)

      -- for i=1, #ui.windows do
      --    local w = ui.windows[i]
      --    w:update(dt)
      -- end

      for i=1, #ui.panels do
         local p = ui.panels[i]
         p:update(dt)
      end


   end,

   draw = function()

      -- for i=1, #ui.windows do
      --    local w = ui.windows[i]
      --    w:draw()
      -- end
      for i=1, #ui.panels do
         local p = ui.panels[i]
         --print(p.width)
         p:draw()
      end

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
