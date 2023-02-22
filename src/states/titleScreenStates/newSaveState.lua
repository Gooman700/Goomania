newSaveState = {}

function newSaveState:enter()
    local playerData = {}

    playerData.mapX = 0
    playerData.mapY = 0
    playerData.playerX = GAME_WIDTH/2
    playerData.playerY = GAME_HEIGHT/2
    playerData.tileOffsetX = 0
    playerData.tileOffsetY = 0
    playerData.playerParty = {}
    playerData.inventory = {["Pokeball"] = 5}

    local playerRawData = json:encode(playerData)

    love.filesystem.write("gooSave.json", playerRawData)
end

function newSaveState:exit()end

function newSaveState:update(dt)
    pushState(fadeOutState, {loadSaveState, "b"})
end

function newSaveState:draw()
end