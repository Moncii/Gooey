
window = {

   new = function(args_)

      local args = args_ or {}

      local w = {
         title = args.title or "Window",
         x = args.x or 0, y = args.y or 0,
         width = args.width or 256, height = args.height or 256,
         dragging = false,
         dragX = 0, dragY = 0,
         resizing = false,
         resizeX = 0, resizeY = 0,
         depth = 1,
      }

      local height = ui.theme.font:getHeight()

      w.panel = ui.panel.new({
         x = w.x, y = w.y+height,
         width = w.width, height = w.height,
      })

      w.update = function(self, dt)



         local height = ui.theme.font:getHeight()

         if(ui.mouseInPoint(self.x, self.y, self.width, height)) then

            local isPressed, pos, duration = Input.pressed('mouse1')

            if(isPressed) then

               for i=1, #ui.panels do
                  local p = ui.panels[i]
                  p.depth = 1
               end
               -- for i=1, #ui.windows do
               --    local w = ui.windows[i]
               --    w.depth = 1
               -- end
               self.depth = 0
               self.panel.depth = -1

               table.sort(ui.panels, function(a, b) return a.depth > b.depth end)
               --table.sort(ui.windows, function(a, b) return a.depth > b.depth end)

               self.dragX = pos.x - self.x
               self.dragY = pos.y - self.y
               self.dragging = true
            end

         end

         if(ui.mouseInPoint(self.x+self.width-12, self.y+self.height+height-12, 12, 12)) then

            local isPressed, pos, duration = Input.pressed('mouse1')

            if(isPressed) then

               self.resizeX = pos.x - (self.x+self.width-12)
               self.resizeY = pos.y - (self.y+self.height-12)
               self.resizing = true
            end

         end

         local isDown, pos, duration = Input.pressed('mouse1')

         if(self.dragging) then
            local mx, my = love.mouse.getPosition()
            self.x = mx - self.dragX
            self.y = my - self.dragY
         end

         if(self.resizing) then
            local mx, my = love.mouse.getPosition()
            self.width = mx - self.x
            self.height = my - self.y
         end

         local isReleased, pos, duration = Input.released('mouse1')
         if(isReleased) then
            self.dragging = false
            self.resizing = false
         end

         self.panel.x = self.x
         self.panel.y = self.y + height
         self.panel.width = self.width
         self.panel.height = self.height


      end

      w.draw = function(self)

         local height = ui.theme.font:getHeight()

         love.graphics.setColor(ui.theme.titleBarColor)
         love.graphics.rectangle("fill", self.x, self.y, self.width, height)

         love.graphics.setColor(ui.theme.textColor)
         love.graphics.printf(self.title, self.x, self.y, self.width, "center")

      end

      table.insert(ui.panels, w)

      return w.panel

   end,

}

return window
