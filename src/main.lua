function --love.load()love.filesystem.setRequirePath("src/modules?.lua;")

  
  local Player = require("src/modules/Player")
  player = Player.new()
end

function love.draw()
  player:draw()
end
