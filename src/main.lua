love.filesystem.setRequirePath("modules/?.lua;modules/HC/?.lua")

-- Load modules globally
_G.Player = require("Player")
_G.Vector2 = require("Vector2")
_G.HC = require("HC")

function love.load()
  player = Player.new(Vector2.new(80, 80))
end

function love.update(dt)
  player:update(dt)
end
function love.draw()
  love.graphics.clear()
  player:draw()
end
