--WHERE ALL FILES ARE REQUIRED AND ALL GLOBAL TABLES ARE INITIALISED

Class = require("libraries/class")
push = require("libraries/push")
json = require("libraries/json")

require("src/constants")--all constant values

require("src/util")

require("src/stateStack")--the state stack handling functions
require("src/states/titleScreenState")--self explanitory names
require("src/states/mainMenuState")
require("src/states/loadSaveState")
require("src/states/saveState")
require("src/states/playState")
require("src/states/textState")
require("src/states/pauseState")
require("src/states/settings")
require("src/states/volume")
require("src/states/confirmState")
require("src/states/fadeInState")
require("src/states/fadeOutState")

require("src/gui")--gui elements e.g. text boxes, panels

--initialise all fonts into this global table which can be called upon using the small/medium/large keys
gFonts = {
    ["small"] = love.graphics.newFont("assets/fonts/font.ttf", 8),
    ["medium"] = love.graphics.newFont("assets/fonts/font.ttf", 16),
    ["large"] = love.graphics.newFont("assets/fonts/font.ttf", 32)
}   
love.graphics.setFont(gFonts["small"])

--initialise the images table to be used
gTextures = {
    ["tileSheet"] = love.graphics.newImage("assets/images/maps/tileSheet.png"),
    ["spriteSheet"] = love.graphics.newImage("assets/images/spriteSheet.png"),
    ["background"] = love.graphics.newImage("assets/images/background.png"),
    ["titleText"] = love.graphics.newImage("assets/images/titleText.png"),

    ["sweep"] = love.graphics.newImage("assets/images/sweep.png"),
    ["empurr"] = love.graphics.newImage("assets/images/empurr.png")
}

--table made up of quads taken from various images in the textures table
gFrames = {
    ["tiles"] = generateQuads(gTextures["tileSheet"], 64, 64),
    ["sprites"] = generateQuads(gTextures["spriteSheet"], 60, 100)
}

--table with all sounds to be used
gSounds = {
    ["menuMusic"] = love.audio.newSource("assets/sounds/menuMusic.mp3","stream"),
    ["select"] = love.audio.newSource("assets/sounds/select.mp3","static"),
    ["fieldMusic"] = love.audio.newSource("assets/sounds/fieldMusic.wav","stream")
}