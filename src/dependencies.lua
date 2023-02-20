--WHERE ALL FILES ARE REQUIRED AND ALL GLOBAL TABLES ARE INITIALISED

Class = require("libraries/class")
push = require("libraries/push")
json = require("libraries/json")

require("src/util")

require("src/constants")--all constant values

require("src/stateStack")--the state stack handling functions
require("src/states/titleScreenState")--self explanitory names
require("src/states/mainMenuState")
require("src/states/loadSaveState")
require("src/states/newSaveState")
require("src/states/saveState")
require("src/states/playState")
require("src/states/textState")
require("src/states/pauseState")
require("src/states/settings")
require("src/states/volume")
require("src/states/confirmState")
require("src/states/fadeInState")
require("src/states/fadeOutState")
require("src/states/battleMenuState")
require("src/states/slideImageState")

require("src/gui")--gui elements e.g. text boxes, panels