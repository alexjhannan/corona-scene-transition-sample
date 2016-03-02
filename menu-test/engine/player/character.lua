-- generateCharacter returns a table with two values:

-- object stores the display object, which has a physics body w/ collision
-- -> for instance, access character.object.x to change the x location of the object

-- sprite stores the sprite graphic of the character, which has sequences and frames and stuff
-- -> for instance, use character.sprite:play() to start the sprite's current sequence

local function generateCharacter( displayName, name, offset, appFont )

	local object = display.newGroup()

	local selOffset = (( (offset or math.random(4)) + 1 ) % 4) * 4

	local sheetOptions = {
		width = 50,
		height = 50,
		numFrames = 64,
		sheetContentWidth = 800,
		sheetContentHeight = 200
	}


	local sheet_sprite = graphics.newImageSheet( "engine/player/images/sprites.png", sheetOptions )

	local sequences_sprite = {
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

	-- make a new sprite from spriteSheet w/ options
	local sprite = display.newSprite( sheet_sprite, sequences_sprite )
	-- set the default sequence (which direction to face)
	sprite:setSequence( "right" )
	-- set the specific frame of the sequence
	sprite:setFrame(1)
	-- insert the sprite into object (true sets sprite position relative to the object)
	object:insert(sprite, true)

	-- create options for physics.addBody
	local objectCollisionFilter = { categoryBits = 2, maskBits = 5 }
    local objectBodyElement = { filter=objectCollisionFilter }
	
    -- add a physics body to the object
	physics.addBody(object, "dynamic", objectBodyElement )

	-- styling the name & displayName
	if name then
		local playerName = display.newText( { parent=object, text=name, x=0, y=-18-sprite.height*0.5, font=appFont, fontSize=20 } )
		playerName.anchorY = 1
	end

	if displayName then
		local playerDisplayName = display.newText( { parent=object, text=displayName, x=0, y=-0-sprite.height*0.5, font=appFont, fontSize=15 } )
		playerDisplayName.anchorY = 1
	end

	return { object=object, sprite=sprite }
end

return generateCharacter