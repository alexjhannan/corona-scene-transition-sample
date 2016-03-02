-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
 -- hide status bar
 display.setStatusBar( display.HiddenStatusBar )

-- pull in composer module
local composer = require 'composer'

-- pull in physics configuration module
local physicsConfig = require 'engine.physics-config'




--scene.view:insert( sprite.group)

-- go to the main menu scene
composer.gotoScene('scenes.main-menu.main')