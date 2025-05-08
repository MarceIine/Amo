love.filesystem.setRequirePath("modules/?.lua")

function love.load()
  local Player = require("Player")
  local Vector2 = require()
  player = Player.new()
end

function love.draw()
  player:draw()
end
