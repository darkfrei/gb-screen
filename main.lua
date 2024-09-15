local GBScreen = require ('src.gb-screen')

function love.resize(w, h)
	print(("Window resized to width: %d and height: %d."):format(w, h))
	GBScreen.resize ()
end

local backimg = love.graphics.newImage('backimg.png')


function love.draw ()
	
	love.graphics.setCanvas(GBScreen.canvas)
		love.graphics.setColor (1,1,1)
		love.graphics.rectangle ('fill', 0, 0, GBScreen.GB_Width, GBScreen.GB_Height)
		love.graphics.setColor (0,0,0)
		love.graphics.line (0,0, 160, 144)
		love.graphics.line (0,144, 160, 0)
	love.graphics.setCanvas()

	love.graphics.setColor (1,1,1)
	GBScreen.drawCanvas ()
	
	love.graphics.setColor (1,1,1)
	love.graphics.draw (backimg)


end