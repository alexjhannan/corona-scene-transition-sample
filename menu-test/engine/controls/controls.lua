-- this file returns a function which takes an object, the player, so that it can initialize the controls
function controlWrapper(player)
	-- create a display group for the controls
	local controls = display.newGroup()

	-- one rectangle for each direction
	local controlUp = display.newRect(controls, display.viewableContentWidth/5, display.viewableContentHeight/6*4.5 - 25, 25, 25)
	controlUp:setFillColor(0,0, 1)
	local controlRight = display.newRect(controls, display.viewableContentWidth/5 + 25, display.viewableContentHeight/6*4.5, 25, 25)
	controlRight:setFillColor(0,0, 1)
	local controlLeft = display.newRect(controls, display.viewableContentWidth/5 - 25, display.viewableContentHeight/6*4.5, 25, 25)
	controlLeft:setFillColor(0,0, 1)
	local controlDown = display.newRect(controls, display.viewableContentWidth/5, display.viewableContentHeight/6*4.5 + 25, 25, 25)
	controlDown:setFillColor(0,0, 1)

	-- callback functions for controls
	local function onTapUp() 
		player.group.y = player.group.y - 10
		player.anim:setSequence("up") 
	end
	local function onTapRight() 
		player.group.x = player.group.x + 10 
		player.anim:setSequence("right") 
	end
	local function onTapDown() 
		player.group.y = player.group.y + 10 
		player.anim:setSequence("down") 
	end
	local function onTapLeft() 
		player.group.x = player.group.x - 10 
		player.anim:setSequence("left") 
	end

	-- attach event listeners
	controlUp:addEventListener('tap', onTapUp)
	controlRight:addEventListener('tap', onTapRight)
	controlDown:addEventListener('tap', onTapDown)
	controlLeft:addEventListener('tap', onTapLeft)

	-- and return the (now initialized) controls
	return controls
end

-- return the function wrapper when required
return controlWrapper