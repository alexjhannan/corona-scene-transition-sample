local composer = require( "composer" )

local scene = composer.newScene()


-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view



    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc


    -- Title for level 1 (attached to sceneGroup)
    local text = display.newText({parent=sceneGroup, text='Sub', x=display.contentWidth/2, y=display.contentHeight/4, fontSize=30})

   
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    -- NOTE: THIS LINE IS SUPER DUPER IMPORTANT, OTHERWISE OLD OBJECTS MAY BE HIDDEN AND CAUSE COLLISIONS 
    -- MAKE SURE THIS IS INCLUDED IN ALL SCENE:SHOW FUNCTIONS
    composer.removeHidden(false)

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)

         -- load player
        local player = require 'player'
        sceneGroup:insert(player)
        -- set player location
        player.x = 200
        player.y = 150

        local function doSomething ()
            print('hi')
            local options = {
                effect = "fade",
                time = 500,
                params = {
                    someKey = "someValue",
                    someOtherKey = 10
                }
            }

            timer.performWithDelay(100, composer.gotoScene('level.main-menu', options))
        end
        -- circle for clickin'
        local circle = display.newCircle(sceneGroup, display.contentWidth/2, display.contentHeight/5*4, 30)
        local collisionFilter = { categoryBits = 4, maskBits = 2 } -- collides with player only
        local body = { filter=collisionFilter, isSensor=true }
        physics.addBody ( circle, body )

        circle:addEventListener('collision', doSomething)

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene