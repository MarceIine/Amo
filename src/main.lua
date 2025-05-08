love.filesystem.setRequirePath("modules/?.lua;modules/?/init.lua")

-- Load modules globally
_G.Player = require("Player")
_G.Vector2 = require("Vector2")
_G.Collectable = require("Collectable")
_G.HC = require("HC")

local collisionText = ""
local objects = {}

function love.keypressed(key, scancode, isrepeat)
	if key == "escape" or key == "q" then
		love.event.quit()
	end
end

function love.load()
	local coin = love.graphics.newImage("assets/images/coin.png")
	local size = Vector2.new(80, 80)
	for index = 1, 10 do
		local position = Vector2.new(love.math.random(0, 800), love.math.random(0, 600))
		local newCollectable = Collectable.new(position, size, coin)
		table.insert(objects, newCollectable)
	end
	-- Create player
	player = Player.new(Vector2.new(80, 80))
end

function love.update(dt)
	player:update(dt)

	collisionText = ""
	-- Check collisions between player and all objects
	for name, obj in pairs(objects) do
		local collides, dx, dy = player.collision:collidesWith(obj.collision)
		if collides then
			collisionText = collisionText .. string.format("\nCollision with %s! Delta: %.2f, %.2f", name, dx, dy)
			table.remove(objects, name)
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
		obj:draw("fill")
	end

	-- Draw player
	love.graphics.setColor(1, 1, 1)
	player:draw()

	-- Draw collision text
	love.graphics.print(collisionText, 10, 10)
end
