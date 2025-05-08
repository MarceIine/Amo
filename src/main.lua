
love.filesystem.setRequirePath("modules/?.lua")

function love.load()
  local Player = require("Player")
  player = Player.new()
end

function love.draw()
  player:draw()
end
