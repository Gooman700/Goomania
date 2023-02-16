loadSaveState = {}
playerMap = {
    ["floor"] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}
    },
    ["collision"] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}
    },
    ["interaction"] = {
        {},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}
    },

    ["length"] = 32,
    ["height"] = 19
}


function loadSaveState:enter()
    mapX = 0
    mapY = 0

    moveMap(mapX,mapY)

    clearState(playState)    
end

function loadSaveState:exit()end

function loadSaveState:update(dt)end

function loadSaveState:draw()end