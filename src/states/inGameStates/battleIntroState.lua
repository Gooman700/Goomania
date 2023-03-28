battleIntroState = {}

local panelXY
local panelFinalXY

local opponentXY
local opponentFinalXY

local playerXY
local playerFinalXY

local timer
local timeToComplete

function battleIntroState:enter()

    timer = 0
    timeToComplete = 2

    --clear the table every encounter as to not leak memory
    wildGoomon = {}
    local wildStats = {}
    local wildName = routeOne["wildGoomon"][math.random(1, #routeOne["wildGoomon"])]
    local wildLevel = math.random(routeOne["level"]-2, routeOne["level"]+2)
    wildStats = {
        maxHealth = defGoomon[wildName]["health"]+(wildLevel*(math.random(1,3))),
        attack = defGoomon[wildName]["attack"]+(wildLevel*(math.random(1,3))), 
        defense = defGoomon[wildName]["defense"]+(wildLevel*(math.random(1,3))), 
        speed = defGoomon[wildName]["speed"]+(wildLevel*(math.random(1,3)))
    }
    --select the wild goomon as one of the goomon that can spawn in the current route with allocated stats
    wildGoomon = {name = wildName, maxHealth = wildStats.maxHealth, health = wildStats.maxHealth, level = wildLevel, attack = wildStats.attack, defense = wildStats.defense, speed = wildStats.speed}

    panelXY = {0, GAME_HEIGHT}
    panelFinalXY = {0, 0}

    opponentXY = {GAME_WIDTH, 100}
    opponentFinalXY = {2*(GAME_WIDTH/3), 250}

    playerXY = {-400, GAME_HEIGHT-100}
    playerFinalXY = {GAME_WIDTH/4-100, GAME_HEIGHT-100-400}

    pushState(fadeInState, {"w", 0.2})
end

function battleIntroState:exit()end

function battleIntroState:update(dt)
    if timer < timeToComplete then 
        timer = timer + dt
        panelXY = slideImageUpdate(panelXY, panelFinalXY, timer, timeToComplete, dt)
        opponentXY = slideImageUpdate(opponentXY, opponentFinalXY, timer,timeToComplete, dt)
        playerXY = slideImageUpdate(playerXY, playerFinalXY, timer, timeToComplete, dt)
    else
        changeState(battleFightState)
    end
end

function battleIntroState:draw()
    love.graphics.draw(gTextures["battleScene"], 0, panelXY[2])
    love.graphics.draw(defGoomon[wildGoomon.name].image, opponentXY[1], opponentFinalXY[2])
    love.graphics.draw(defGoomon[playerParty[1].name].backImage, playerXY[1], playerFinalXY[2])
end