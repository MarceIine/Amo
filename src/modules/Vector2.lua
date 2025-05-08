local Vector2 = {}
Vector2.__index = Vector2

function Vector2.new(x, y)
  local self = setmetatable({}, Vector2)
  self.x = x or 0
  self.y = y or 0
  return self
end

return Vector2