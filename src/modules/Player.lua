local keybinds = {
  up = {"w", "up"},
  down = {"s", "down"},
  left = {"a", "left"},
  right = {"d", "right"}
}

-- Loading the image here to avoid loading it multiple times
local playerImage = love.graphics.newImage("assets/images/Character.png")

local Player = {}
Player.__index = Player

function Player.new(size, position)
  local self = setmetatable({}, Player)
  self.position = position or Vector2.new(0,0)
  self.size = size or Vector2.new(80, 80)
  self.speed = 100
  self.moveDirection = Vector2.new(0,0)
  self.debug = false

  self.collision = HC.rectangle(self.position.x, self.position.y, self.size.x, self.size.y)
  return self
end

function Player:draw(color)
  if self.debug then
    self.collision:draw("fill")
  end
  
  love.graphics.draw(playerImage, self.position.x, self.position.y, 0, self.size.x / playerImage:getWidth(), self.size.y / playerImage:getHeight())
end

function Player:update(dt)
  -- Up
  if love.keyboard.isDown(keybinds.up) then
    self.moveDirection.y = -1
  end
  -- Down
  if love.keyboard.isDown(keybinds.down) then
   self.moveDirection.y = 1
  end
  -- Left
  if love.keyboard.isDown(keybinds.left) then
    self.moveDirection.x = -1
  end
  -- Right
  if love.keyboard.isDown(keybinds.right) then
   self.moveDirection.x = 1
  end
  
  -- Update position first
  self.position.x = self.position.x + self.moveDirection.x * self.speed * dt
  self.position.y = self.position.y + self.moveDirection.y * self.speed * dt
  
  -- Update collision box position to match player position
  self.collision:moveTo(self.position.x + self.size.x/2, self.position.y + self.size.y/2)
  
  -- Reset movement direction
  self.moveDirection = Vector2.new(0,0)
end

return Player