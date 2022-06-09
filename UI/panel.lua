
panel = {

   new = function(args_)

      local args = args_ or {}

      local p = {
         x = args.x or 32, y = args.y or 32,
         width = args.width or 256, height = args.height or 256,
         rounding = args.rounding or 2,
         contents = {},
         depth = 1,
      }

      p.update = function(self, dt)

         for i=1, #self.contents do
            local e = self.contents[i]
            e:update(dt)
         end

      end

      p.draw = function(self)

         love.graphics.setColor(ui.theme.bgColor)

         love.graphics.rectangle('fill', self.x, self.y, self.width, self.height, self.rounding, self.rounding)

         for i=1, #self.contents do
            local e = self.contents[i]
            e:draw()
         end

      end

      table.insert(ui.panels, p)
      return ui.panels[#ui.panels]

   end,

}

return panel
