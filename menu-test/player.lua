physics.start()

physics.setGravity(0,0)

function createPlayer(x, y, width, height, rotation)
    local p = display.newRect( x, y, width, height )
    p:setFillColor( 0, 1, 0 )
    p.rotation = rotation

    local playerCollisionFilter = { categoryBits = 2, maskBits = 5 }
    local playerBodyElement = { filter=playerCollisionFilter }

    p.isBullet = true
    p.objectType = "player"
    physics.addBody ( p, "dynamic", playerBodyElement )
    p.isSleepingAllowed = false

    return p
end

local player = createPlayer( display.viewableContentWidth / 2, display.viewableContentHeight / 2, 20, 20, 45)

local controls = display.newGroup()

local controlUp = display.newRect(controls, display.viewableContentWidth/5, display.viewableContentHeight/6*4.5 - 25, 25, 25)
controlUp:setFillColor(0,0, 1)

local controlRight = display.newRect(controls, display.viewableContentWidth/5 + 25, display.viewableContentHeight/6*4.5, 25, 25)
controlRight:setFillColor(0,0, 1)

local controlLeft = display.newRect(controls, display.viewableContentWidth/5 - 25, display.viewableContentHeight/6*4.5, 25, 25)
controlLeft:setFillColor(0,0, 1)

local controlDown = display.newRect(controls, display.viewableContentWidth/5, display.viewableContentHeight/6*4.5 + 25, 25, 25)
controlDown:setFillColor(0,0, 1)

local function onTapUp()
    player.y = player.y - 10
end

local function onTapRight()
	player.x = player.x + 10
end

local function onTapDown()
	player.y = player.y + 10
end

local function onTapLeft()
	player.x = player.x - 10
end

local function test()
	print('yo')
end

controlUp:addEventListener('tap', onTapUp)
controlRight:addEventListener('tap', onTapRight)
controlDown:addEventListener('tap', onTapDown)
controlLeft:addEventListener('tap', onTapLeft)

return player