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
    local playerRawData = love.filesystem.read("gooSave.json")
    local playerData = json:decode(playerRawData)

    mapX = playerData.mapX
    mapY = playerData.mapY
    playerX = playerData.playerX
    playerY = playerData.playerY
    tileOffsetX = playerData.tileOffsetX
    tileOffsetY = playerData.tileOffsetY
    playerParty = playerData.playerParty
    inventory = playerData.inventory

    for i = 1, #playerParty do
        playerPokemon[i] = playerParty[i]
    end

    moveMap(mapX,mapY)

    clearState(playState)
end

function loadSaveState:exit()end

function loadSaveState:update(dt)end

function loadSaveState:draw()end