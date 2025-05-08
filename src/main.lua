love.filesystem.setRequirePath("modules/?.lua")

-- Load modules globally
_G.Player = require("Player")
_G.Vector2 = require("Vector2")

function love.load()
  player = Player.new()
end

function love.draw()
  player:draw()
end
