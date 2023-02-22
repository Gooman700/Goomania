--WHERE ALL FILES ARE REQUIRED AND ALL GLOBAL TABLES ARE INITIALISED

Class = require("libraries/class")
push = require("libraries/push")
json = require("libraries/json")

require("src/util")

require("src/constants")--all constant values

require("src/stateStack")--the state stack handling functions
require("src/states/titleScreenStates/titleScreenState")--self explanitory names
require("src/states/titleScreenStates/mainMenuState")
require("src/states/titleScreenStates/loadSaveState")
require("src/states/titleScreenStates/newSaveState")
require("src/states/titleScreenStates/volume")
require("src/states/titleScreenStates/settings")

require("src/states/inGameStates/saveState")
require("src/states/inGameStates/playState")
require("src/states/inGameStates/battleIntroState")
require("src/states/inGameStates/fieldMenuState")
require("src/states/inGameStates/fieldExitState")

require("src/states/transitionStates/fadeInState")
require("src/states/transitionStates/fadeOutState")

require("src/states/textState")
require("src/states/confirmState")
require("src/states/quitState")

require("src/gui")--gui elements e.g. text boxes, panels