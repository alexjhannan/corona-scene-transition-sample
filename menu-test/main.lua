-----------------------------------------------------------------------------------------
--
-- main.lua
-- hides status bar, loads composer, initializes physics engine
-- transition to main menu scene
-----------------------------------------------------------------------------------------
 -- hide status bar
 display.setStatusBar( display.HiddenStatusBar )

-- pull in composer module
local composer = require 'composer'

-- pull in physics configuration module
local physicsConfig = require 'engine.physics-config'

-- go to the main menu scene
composer.gotoScene('scenes.main-menu.main')