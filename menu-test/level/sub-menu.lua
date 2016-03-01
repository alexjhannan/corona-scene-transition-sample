-- this file is virtually identical to main-menu.lua; see main-menu.lua for comments
local composer = require 'composer'
local controls = require 'controls'
local player = require 'player'

local scene = composer.newScene()

function scene:create( event )

    local sceneGroup = self.view

    local text = display.newText({parent=sceneGroup, text='Sub', x=display.contentWidth/2, y=display.contentHeight/4, fontSize=30})
end


function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    composer.removeHidden(false)

    if ( phase == "will" ) then
        
        sceneGroup:insert(player)

        player.x = 200
        player.y = 150

        controls = controls(player)

        sceneGroup:insert(controls)

        local function transitionScene ()
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
        local collisionFilter = { categoryBits = 4, maskBits = 2 }
        local body = { filter=collisionFilter, isSensor=true }
        physics.addBody ( circle, body )

        circle:addEventListener('collision', transitionScene)
    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene