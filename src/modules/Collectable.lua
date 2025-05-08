local Collectable = {}
Collectable.__index = Collectable

function Collectable.new(position, size, image)
  local self = setmetatable({}, Collectable)
  self.position = position or Vector2.new(0,0)
  self.size = size or Vector2.new(80, 80)
  self.image = image
  self.debug = false
  self.collision = HC.rectangle(
    self.position.x, 
    self.position.y, 
    self.size.x , 
    self.size.y 
  )
  
  self.collision:moveTo(self.position.x + self.size.x / 2, self.position.y + self.size.y / 2)
  return self
end

function Collectable:draw()
  if self.debug then
     self.collision:draw("fill")
  end
 
  love.graphics.draw(self.image, self.position.x, self.position.y, 0, self.size.x / self.image:getWidth(), self.size.y / self.image:getHeight())
end

return Collectable