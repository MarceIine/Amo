
love.filesystem.setRequirePath("modules/?.lua;modules/HC/?.lua")

-- Load modules globally
_G.Player = require("Player")
_G.Vector2 = require("Vector2")
_G.HC = require("HC")

local collisionText = ""

function love.load()
  -- Create ground rectangle
  rect = HC.rectangle(200, 400, 400, 20)
  
  -- Create player
  player = Player.new(Vector2.new(80, 80))
end

function love.update(dt)
  player:update(dt)
  
  -- Check collisions
  local collisions = HC.collisions(player.collision)
  for shape, delta in pairs(collisions) do
    collisionText = string.format("Collision detected! Delta: %.2f, %.2f", delta.x, delta.y)
    -- Push player back by collision vector
    player.position.x = player.position.x + delta.x
    player.position.y = player.position.y + delta.y
    player.collision:moveTo(player.position.x + player.size.x/2, player.position.y + player.size.y/2)
  end
  
  if next(collisions) == nil then
    collisionText = "No collisions"
  end
end

function love.draw()
  love.graphics.clear()
  
  -- Draw ground rectangle
  rect:draw('fill')
  
  -- Draw player
  player:draw()
  
  -- Draw collision text
  love.graphics.setColor(1, 1, 1)
  love.graphics.print(collisionText, 10, 10)
end
