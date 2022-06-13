
-- Clascii v0.1
-- Created by Moncii
-- MIT liscense

clascii = function(extends)

   local object = {}
   object.__index = object

   if(extends ~= nil) then
      function extends:super(...)
         self:init(...)
      end
      setmetatable(object, extends)
   end

   function object:new(...)

      instance = setmetatable({}, self)

      if(instance.init ~= nil) then
         instance:init(...)
      end

      return instance

   end

   return object

end

return clascii
