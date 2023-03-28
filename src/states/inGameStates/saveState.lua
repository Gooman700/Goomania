saveState = {}

function saveState:enter()
    local playerRawData = love.filesystem.read("gooSave.json")
    local playerData = json:decode(playerRawData)

    playerData.mapX = mapX 
    playerData.mapY = mapY
    playerData.playerX = playerX
    playerData.playerY = playerY
    playerData.tileOffsetX = tileOffsetX
    playerData.tileOffsetY = tileOffsetY

    for i = 1, #playerParty do
        local goomon = playerParty[i]
        playerData.playerParty[i] = {["name"] = goomon.name, ["maxHealth"] = goomon.maxHealth, ["health"] = goomon.health, ["level"] = goomon.level, ["attack"] = goomon.attack, ["defense"] = goomon.defense, ["speed"] = goomon.speed}
    end

    local updatedData = json:encode(playerData)
    love.filesystem.write("gooSave.json", updatedData)
end

function saveState:exit()end

function saveState:update(dt)
    popState()
end

function saveState:draw()

end