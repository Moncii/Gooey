
button = {

   new = function(parent, args_)

      local args = args_ or {}

      local b = {
         parent = parent,
         text = args.text or "Button",
         x = 0, y = 0,
         width = 0, height = 0,
         rounding = args.rounding or 2,
         hover = false,
         margin = args.margin or 2, spacing = args.spacing or 2,
         align = args.align or "left", -- left, center, or right.
         action = args.action or nil,
      }
      b.pos = #b.parent.contents

      b.update = function(self, dt)

         self.width = ui.theme.font:getWidth("A"..self.text.."A") + self.margin
         self.height = ui.theme.font:getHeight() + (self.spacing*2)

         local offsetY = 0
         for i=1, self.pos do
            local e = self.parent.contents[i]
            offsetY = offsetY + e.height
         end
         
         local width = ui.theme.font:getWidth("A"..self.text.."A")
         
         local offsetX = 0
         if(self.align == "center") then
            offsetX = (self.parent.width/2) - (width/2)
         elseif(self.align == "left") then      
            offsetX = self.margin 
         elseif(self.align == "right") then
            offsetX = self.parent.width-self.width-self.margin
         end

         self.x = self.parent.x + offsetX
         self.y = self.parent.y + self.spacing + offsetY

         local height = ui.theme.font:getHeight()

         if(ui.mouseInPoint(self.x, self.y, self.width, height)) then
            self.hover = true
         else
            self.hover = false
         end

         if(self.hover) then
            local isPressed, pos, duration = Input.pressed('mouse1')
            if(isPressed) then
               if(self.action ~= nil) then
                  self.action()
               end
            end
         end

      end

      b.draw = function(self)

         local width = ui.theme.font:getWidth("A"..self.text.."A")
         local height = ui.theme.font:getHeight()

         if(self.hover) then
            love.graphics.setColor(ui.theme.buttonHoverColor)
         else
            love.graphics.setColor(ui.theme.buttonColor)
         end

         love.graphics.rectangle("line", self.x, self.y, width, height, self.rounding, self.rounding)
         love.graphics.rectangle("fill", self.x, self.y, width, height, self.rounding, self.rounding)
         love.graphics.setColor(ui.theme.textColor)
         love.graphics.printf(self.text, self.x, self.y, width, "center")

      end

      table.insert(parent.contents, b)

   end,

}

return button
