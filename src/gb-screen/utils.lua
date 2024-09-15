-- utils GB screen
print ('loaded', ...)

local function resize (w, h)

end

return function (GBScreen)

	local Screen = GBScreen
	love.graphics.setDefaultFilter( "nearest", "nearest", anisotropy )
	love.graphics.setLineStyle( "rough" )

	Screen.resize = function (w, h)
		local windowWidth = w or love.graphics.getWidth()
		local windowHeight = h or love.graphics.getHeight()
		local scaleW = windowWidth/Screen.GB_Width
		local scaleH = windowHeight/Screen.GB_Height
--		print ('width', windowWidth, Screen.GB_Width, scaleW)
--		print ('height', windowHeight, Screen.GB_Height, scaleH)
		Screen.scale = math.floor (math.min (scaleW, scaleH))
		Screen.dpiscale = 1/Screen.scale

		print ('dpiscale', Screen.dpiscale)

		local width = Screen.GB_Width / Screen.dpiscale
		local height = Screen.GB_Height / Screen.dpiscale

		Screen.canvasX = (windowWidth-width)/2
		Screen.canvasY = (windowHeight-height)/2

		Screen.canvas = love.graphics.newCanvas(Screen.GB_Width, Screen.GB_Height)

		love.graphics.setCanvas(GBScreen.canvas)
		love.graphics.setColor (1,1,1)
		love.graphics.rectangle ('fill', 0, 0, Screen.GB_Width, Screen.GB_Height)
		love.graphics.setCanvas()

		print ('resized', windowWidth, windowHeight)
	end


	love.window.setMode( 1280, 800, {resizable = true} )

	Screen.resize ()

	local function bresenham(x1, y1, x2, y2)
		local points = {}

		local dx = math.abs(x2 - x1)
		local dy = math.abs(y2 - y1)
		local sx = (x1 < x2) and 1 or -1
		local sy = (y1 < y2) and 1 or -1
		local err = dx - dy

		while true do
			table.insert(points, {x1, y1})
			if x1 == x2 and y1 == y2 then break end
			local e2 = 2 * err
			if e2 > -dy then
				err = err - dy
				x1 = x1 + sx
			end
			if e2 < dx then
				err = err + dx
				y1 = y1 + sy
			end
		end

		return points
	end
	
	
end

