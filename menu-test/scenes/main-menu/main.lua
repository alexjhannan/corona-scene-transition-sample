-- pull in the composer
local composer = require 'composer'

-- load control generator to be initialized with a player object
local generateControls = require 'engine.controls.controls'

-- load a character generator to be initialized with player information
local generateCharacter = require 'engine.player.character'

-- create a new scene object; store locally
local scene = composer.newScene()

function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here

    -- title for main menu
    local text = display.newText({parent=sceneGroup, text='Main', x=display.contentWidth/2, y=display.contentHeight/4, fontSize=30})
end


function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    -- this line is VERY IMPORTANT. without it, old physics bodies from the previous scene WILL NOT be removed, 
    -- meaning unwanted collisions can take place and fire off non-existant event listeners.
    -- seems to work best when called at this point in the scene transition flow
    composer.removeHidden(false)

    if ( phase == "will" ) then
        
        -- initialize the character with relevant information
        -- character -> { object, anim }, where object is the display object, and anim is the animation sequence
        local character = generateCharacter("Boss","Jedi",1,"Helvetica")
        -- set a static location (should be queried from tiled)
        character.group.x = 100
        character.group.y = 100

        -- insert the character into the sceneGroup (so it is removed upon scene transition)
        sceneGroup:insert(character.group)
        -- initialize controls from control generator by passing in the character object
        local controls = generateControls(character)
        -- attach controls to the sceneGroup
        sceneGroup:insert(controls)

        -- transitions the scene
        local function transitionScene ()
            -- animation options for scene transition. parameters can be passed from scene to scene with the 'params' key
            local options = {
                effect = "fade",
                time = 500,
                params = {
                    someKey = "someValue",
                    someOtherKey = 10
                }
            }
            -- invoke composer to change scenes
            composer.gotoScene('scenes.sub-menu.main', options)
        end
        
        -- create a circle (note: this is also attached to sceneGroup!)
        local circle = display.newCircle(sceneGroup, display.contentWidth/2, display.contentHeight/5*3, 30)
        -- build a collisionFilter table (see Corona documentation, collision filters are a bit wonky)
        -- in this setup, the circle can only collide with the player
        local collisionFilter = { categoryBits = 4, maskBits = 2 }
        -- build a body table (uses collisionFilter)
        local body = { filter=collisionFilter, isSensor=true }
        -- add a physics body to the circle
        physics.addBody ( circle, body )
        -- give the circle an event listener; when it collides, run transitionScene
        circle:addEventListener('collision', transitionScene)
    end
end

-- add event listeners to the scene to trigger the scene transition flow properly
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

-- return the scene (necessary for the module to load via composer.gotoScene)
return scene