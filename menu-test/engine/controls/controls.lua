-- this file returns a function which takes an object, the character, so that it can initialize the controls
function generateControls(character)
	-- create a display object for the controls
	local controls = display.newGroup()

	-- one rectangle for each direction (currently uses global coordinates, but should be created with coordinates relative to the 'controls' display group)
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
		-- 1) set sprite sequence to the correct direction
		-- 2) play the animation
		-- 3) set object's linear velocity
		-- 4) activate a timer
			-- pause the animation
			-- set the velocity to zero
		character.sprite:setSequence("up")
		character.sprite:play()
		character.object:setLinearVelocity(0, -128)
		timer.performWithDelay(250, function() 
				character.sprite:pause()
				character.object:setLinearVelocity(0, 0) end)
	end
	local function onTapRight() 
		character.sprite:setSequence("right")
		character.sprite:play()
		character.object:setLinearVelocity(128, 0)
		timer.performWithDelay(250, function() 
				character.sprite:pause()
				character.object:setLinearVelocity(0, 0) end)
	end
	local function onTapDown() 
		character.sprite:setSequence("down")
		character.sprite:play()
		character.object:setLinearVelocity(0, 128)
		timer.performWithDelay(250, function() 
				character.sprite:pause()
				character.object:setLinearVelocity(0, 0) end)
	end
	local function onTapLeft() 
		character.sprite:setSequence("left")
		character.sprite:play()
		character.object:setLinearVelocity(-128, 0)
		timer.performWithDelay(250, function() 
				character.sprite:pause()
				character.object:setLinearVelocity(0, 0) end)
	end

	--[[ Keyboard controls commented out (only used for development)
	-- KeyBoard Control
	local function onKeyEvent( event )
    -- Print which key was pressed down/up
    local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
    print( message )

    -- If the "back" key was pressed on Android or Windows Phone, prevent it from backing out of the app
    if ( event.keyName == "down" ) then
        local platformName = system.getInfo( "platformName" )
        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
            return true
        end
        onTapDown()
    end

    if ( event.keyName == "up" ) then
        local platformName = system.getInfo( "platformName" )
        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
            return true
        end
        onTapUp()
    end

    if ( event.keyName == "right" ) then
        local platformName = system.getInfo( "platformName" )
        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
            return true
        end
        onTapRight()
    end

    if ( event.keyName == "left" ) then
        local platformName = system.getInfo( "platformName" )
        if ( platformName == "Android" ) or ( platformName == "WinPhone" ) then
            return true
        end
        onTapLeft()
    end
    -- IMPORTANT! Return false to indicate that this app is NOT overriding the received key
    -- This lets the operating system execute its default handling of the key
    return false
	end -- ]]
	

	-- attach event listeners to control taps
	controlUp:addEventListener('touch', onTapUp)
	controlRight:addEventListener('touch', onTapRight)
	controlDown:addEventListener('touch', onTapDown)
	controlLeft:addEventListener('touch', onTapLeft)
	
	-- Keypress commented out (only used for development)
	-- Runtime:addEventListener( "key", onKeyEvent )

	-- and return the (now initialized) controls
	return controls
end

-- return the function wrapper when required
return generateControls