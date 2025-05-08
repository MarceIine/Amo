
love.filesystem.setRequirePath("modules/?.lua;modules/HC/?.lua")

-- Load modules globally
_G.Player = require("Player")
_G.Vector2 = require("Vector2")
_G.HC = require("HC")

local collisionText = ""
local objects = {}

function love.load()
  -- Create ground rectangle
  objects.ground = HC.rectangle(200, 400, 400, 20)
  objects.box1 = HC.rectangle(300, 300, 50, 50)
  objects.box2 = HC.rectangle(400, 200, 40, 40)
  
  -- Create player
  player = Player.new(Vector2.new(80, 80))
end

function love.update(dt)
  player:update(dt)
  
  collisionText = ""
  -- Check collisions between player and all objects
  for name, obj in pairs(objects) do
    local collides, dx, dy = player.collision:collidesWith(obj)
    if collides then
      collisionText = collisionText .. string.format("\nCollision with %s! Delta: %.2f, %.2f", name, dx, dy)
      -- Push player back by collision vector
      player.position.x = player.position.x + dx
      player.position.y = player.position.y + dy
      player.collision:moveTo(player.position.x + player.size.x/2, player.position.y + player.size.y/2)
    end
  end
  
  if collisionText == "" then
    collisionText = "No collisions"
  end
end

function love.draw()
  love.graphics.clear()
  
  -- Draw all objects
  for _, obj in pairs(objects) do
    love.graphics.setColor(0.5, 0.5, 1)
    obj:draw('fill')
  end
  
  -- Draw player
  love.graphics.setColor(1, 1, 1)
  player:draw()
  
  -- Draw collision text
  love.graphics.print(collisionText, 10, 10)
end
