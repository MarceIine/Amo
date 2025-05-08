local keybinds = {
  up = {"w", "up"},
  down = {"s", "down"},
  left = {"a", "left"},
  right = {"d", "right"}
}

local Player = {}
Player.__index = Player

function Player.new(size, position)
  local self = setmetatable({}, Player)
  self.position = position or Vector2.new(0,0)
  self.size = size or Vector2.new(80, 80)
  self.speed = 100
  self.moveDirection = Vector2.new(0,0)
  return self
end

function Player:draw(color)
  love.graphics.setColor(121, 19, 19) -- Render with black color
  love.graphics.rectangle("fill", self.position.x, self.position.y, self.size.x, self.size.y)
  
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

  -- Move the player in the move direction.
  self.position.x = self.position.x + self.moveDirection.x * self.speed * dt
  self.position.y = self.position.y + self.moveDirection.y * self.speed * dt

  -- I was right to reset the moveDirection at the end
  self.moveDirection = Vector2.new(0,0) -- fuck it, create a new whole vector
  --lol
end

return Player