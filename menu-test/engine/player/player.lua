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

    local object

    return p
end

local player = createPlayer( display.viewableContentWidth / 2, display.viewableContentHeight / 2, 20, 20, 45)

return player