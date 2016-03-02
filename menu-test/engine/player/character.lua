local function generateCharacter( displayName, name, offset, appFont )

	print("generateCharacter called")

	local group = display.newGroup()

	local selOffset = (( (offset or math.random(4)) + 1 ) % 4) * 4

	-- Create our player sprite sheet
	local sheetOptions = {
		width = 50,
		height = 50,
		numFrames = 64,
		sheetContentWidth = 800,
		sheetContentHeight = 200
	}

	local sheet_character = graphics.newImageSheet( "engine/player/images/sprites.png", sheetOptions )

	local sequences_character = {
		{
			name = "down",
			frames = { 1+selOffset, 2+selOffset, 3+selOffset, 1+selOffset, 2+selOffset, 4+selOffset },
			time = 600,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "left",
			frames = { 17+selOffset, 18+selOffset, 19+selOffset, 17+selOffset, 18+selOffset, 20+selOffset },
			time = 600,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "right",
			frames = { 33+selOffset, 34+selOffset, 35+selOffset, 33+selOffset, 34+selOffset, 36+selOffset },
			time = 600,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "up",
			frames = { 49+selOffset, 50+selOffset, 51+selOffset, 49+selOffset, 50+selOffset, 52+selOffset },
			time = 600,
			loopCount = 0,
			loopDirection = "forward"
		},
	}

	-- And, create the player that it belongs to
	local character = display.newSprite( sheet_character, sequences_character )
	character:setSequence( "right" )
	character:setFrame( 2 )
	character:scale(4,4)

	local characterCollisionFilter = { categoryBits = 2, maskBits = 5 }
    local characterBodyElement = { filter=characterCollisionFilter }

	group:insert( character, true )
	character.dispGroup = group

	physics.addBody(group, "dynamic", characterBodyElement )

	if name then
		local playerName = display.newText( { parent=group, text=name, x=0, y=-18-character.height*0.5, font=appFont, fontSize=20 } )
		playerName.anchorY = 1
	end

	if displayName then
		local playerDisplayName = display.newText( { parent=group, text=displayName, x=0, y=-0-character.height*0.5, font=appFont, fontSize=15 } )
		playerDisplayName.anchorY = 1
	end

	return { group=group,anim=character }
end

--local character = generateCharacter("Jedi","right",1,"Helvetica")
--character.group.x = math.random( 50, display.contentWidth - 50 )
--character.group.y = math.random( 50, display.contentHeight - 50 )

return generateCharacter


--local sprite = generateCharacter("Jedi","right",1,"Helvetica")

--sprite.group.x = math.random( 50, display.contentWidth - 50 )
--sprite.group.y = math.random( 50, display.contentHeight - 50 )
