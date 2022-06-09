
checkbox = {

   new = function(parent, args_)

      local args = args_ or {}
      local action = args.action or {}

      local c = {
         parent = parent,
         x = 0, y = 0,
         width = 0, height = 0,
         size = 18,
         rounding = args.rounding or 2,
         checked = false,
         align = args.align or "left",
         margin = args.margin or 2, spacing = args.spacing or 2,
         hover = false,
         action = {checked = action.checked or nil, unchecked = action.unchecked or nil},
      }
      c.pos = #c.parent.contents

      c.update = function(self, dt)

         self.width = self.size + self.margin
         self.height = self.size + (self.spacing*2)

         local offsetY = 0
         for i=1, self.pos do
            local e = self.parent.contents[i]
            offsetY = offsetY + e.height
         end

         local offsetX = 0
         if(self.align == "center") then
            offsetX = (self.parent.width/2) - (self.size/2)
         elseif(self.align == "left") then
            offsetX = self.margin
         elseif(self.align == "right") then
            offsetX = self.parent.width-self.size-self.margin
         end

         self.x = self.parent.x + offsetX
         self.y = self.parent.y + self.spacing + offsetY

         local height = self.size
         if(ui.mouseInPoint(self.x, self.y, self.width, height)) then
            self.hover = true
         else
            self.hover = false
         end

         if(self.hover) then
            local isPressed, pos, duration = Input.pressed('mouse1')
            if(isPressed) then
               self.checked = not self.checked
               if(self.checked) then
                  if(self.action.checked ~= nil) then
                     self.action.checked()
                  end
               else
                  if(self.action.unchecked ~= nil) then
                     self.action.unchecked()
                  end
               end
            end
         end

      end

      c.draw = function(self)

         love.graphics.setColor(ui.theme.buttonColor)
         love.graphics.rectangle('fill', self.x, self.y, self.size, self.size, self.rounding, self.rounding)

         love.graphics.setColor(1,1,1)
         if(self.checked) then
            --love.graphics.draw(drawable, x, y, r, sx, sy, ox, oy, kx, ky)
            love.graphics.draw(ui.theme.iconSource, ui.theme.icons['checkmark'], self.x, self.y, 0, 0.4, 0.4)
         end

      end

      table.insert(c.parent.contents, c)

   end

}

return checkbox
