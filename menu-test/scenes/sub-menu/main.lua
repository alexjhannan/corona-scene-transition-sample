-- this file is virtually identical to main-menu's main.lua; see main-menu for comments
local composer = require 'composer'
local controls = require 'engine.controls.controls'
local generateCharacter = require 'engine.player.character'

local dusk = require("Dusk.Dusk")

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

        local map = dusk.buildMap("maps/house.json")
        sceneGroup:insert(map)
        
        local character = generateCharacter("Boss","Jedi",1,"Helvetica")
        character.object.x = 100
        character.object.y = 100

        sceneGroup:insert(character.object)
        controls = controls(character)
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

            timer.performWithDelay(100, composer.gotoScene('scenes.main-menu.main', options))
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