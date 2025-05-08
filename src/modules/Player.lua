local Player = {}
Player.__index = Player

function Player.new()
  local self = setmetatable({}, Player)
  self.y = 0
  self.x = 0
  self.size = 5
  return self
end

function player:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
end

function Player:update(dt)
end

return Player