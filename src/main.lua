love.filesystem.setRequirePath("modules/?.lua")

-- Load modules globally
_G.Player = require("Player")
_G.Vector2 = require("Vector2")

function love.load()
  player = Player.new(Vector2.new(80, 80))
end

function love.update(dt)
  player:update(dt)
end
function love.draw()
  player:draw()
end
