
text = {

   new = function(parent, args_)

      local args = args_ or {}

      local t = {
         parent = parent,
         text = args.text or "",
         x = 0, y = 0,
         width = 0, height = 0,
         margin = args.margin or 2,
         spacing = args.spacing or 2,
         align = args.align or "left",
      }
      t.pos = #t.parent.contents

      t.update = function(self, dt)

         self.width = self.parent.width-self.margin

         local rw, lines = ui.theme.font:getWrap(self.text, self.width)

         self.height = (ui.theme.font:getHeight() + (self.spacing*2)) * (#lines)

         local offsetY = 0
         for i=1, self.pos do
            local e = self.parent.contents[i]
            --if(i ~= 1) then
               offsetY = offsetY + e.height
            --end
         end

         self.x = self.parent.x + self.margin
         self.y = self.parent.y + self.spacing + offsetY


      end

      t.draw = function(self)

         love.graphics.setColor(ui.theme.textColor)
         love.graphics.printf(self.text, self.x, self.y, self.width, self.align)-- r, sx, sy, ox, oy, kx, ky)

      end

      table.insert(parent.contents, t)

   end

}

return text
