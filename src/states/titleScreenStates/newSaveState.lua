newSaveState = {}

function newSaveState:enter(goomon)
    local playerData = {}

    --using the chosen pokemon from the chooseGoomonState
    playerData.playerParty = {{["name"] = goomon, ["level"] = 5, ["attack"] = 8 + defPokemon[goomon]["attack"], ["defense"] = 8 + defPokemon[goomon]["defense"], ["speed"] = 8 + defPokemon[goomon]["speed"]}}

    playerData.mapX = 0
    playerData.mapY = 0
    playerData.playerX = GAME_WIDTH/2
    playerData.playerY = GAME_HEIGHT/2
    playerData.tileOffsetX = 0
    playerData.tileOffsetY = 0
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