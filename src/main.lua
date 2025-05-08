love.filesystem.setRequirePath("modules/?.lua;modules/HC/?.lua")

local text = {}
-- Load modules globally
_G.Player = require("Player")
_G.Vector2 = require("Vector2")
_G.HC = require("modules/HC")

function love.load()
   rect = HC.rectangle(200,400,400,20)
  
  player = Player.new(Vector2.new(80, 80))
end

function love.update(dt)
  player:update(dt)
  for shape, delta in pairs(HC.collisions(rect)) do
      text[#text+1] = string.format("Colliding. Separating vector = (%s,%s)",
                                    delta.x, delta.y)
  end

  while #text > 40 do
      table.remove(text, 1)
  end
end

function love.draw()
  love.graphics.clear()
  rect:draw('fill')
  player:draw()
end
