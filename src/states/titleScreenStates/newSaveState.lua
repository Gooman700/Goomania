newSaveState = {}

function newSaveState:enter(goomon)
    local playerData = {}

    --using the chosen goomon from the chooseGoomonState
    local goomonStats = {
        maxHealth = defGoomon[goomon]["health"]+(5*(math.random(1,3))),
        attack = defGoomon[goomon]["attack"]+(5*(math.random(1,3))), 
        defense = defGoomon[goomon]["defense"]+(5*(math.random(1,3))), 
        speed = defGoomon[goomon]["speed"]+(5*(math.random(1,3)))
    }
    playerData.playerParty = {{
        ["name"] = goomon, 
        ["level"] = 5, 
        ["maxHealth"] = goomonStats.maxHealth,
        ["health"] = goomonStats.maxHealth, 
        ["attack"] = goomonStats.attack, 
        ["defense"] = goomonStats.defense, 
        ["speed"] = goomonStats.speed
    }}
    goomonStats = {}

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