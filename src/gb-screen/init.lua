print ('loaded', ...)

local GBScreen = {}

require (... ..'.config')(GBScreen) -- wow!
require (... ..'.utils')(GBScreen) -- wow!

-- API

function GBScreen.drawCanvas ()
	love.graphics.setColor (1,1,1)
	love.graphics.draw(GBScreen.canvas, GBScreen.canvasX, GBScreen.canvasY, 0, GBScreen.scale)
end

function GBScreen.line (...)

	local args = {...}
	local lines = {}
	
	
end

return GBScreen




