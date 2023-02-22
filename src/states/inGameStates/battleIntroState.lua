battleIntroState = {}
local wildPokemon

local panelXY = {0, GAME_HEIGHT}
local panelFinalXY = {0, 0}

local opponentXY = {GAME_WIDTH, 100}
local opponentFinalXY = {2*(GAME_WIDTH/3), 180}

local playerXY = {0-400, GAME_HEIGHT-100}
local playerFinalXY = {GAME_WIDTH/4, GAME_HEIGHT-100-400}

local timer
local timeToComplete

function battleIntroState:enter()
    timer = 0
    timeToComplete = 2

    --select the wild pokemon as one of the pokemon that can spawn in the current route
    wildPokemon = routeOne["wildPokemon"][math.random(1, #routeOne["wildPokemon"])]

end

function battleIntroState:exit()end

function battleIntroState:update(dt)
    if timer < timeToComplete then
        timer = timer + dt

        panelXY = slideImageUpdate(panelXY, panelFinalXY, timer, timeToComplete, dt)
        opponentXY = slideImageUpdate(opponentXY, opponentFinalXY, timer,timeToComplete, dt)
        playerXY = slideImageUpdate(playerXY, playerFinalXY, timer, timeToComplete, dt)

    end
end

function battleIntroState:draw()
    love.graphics.draw(gTextures["battleScene"], 0, panelXY[2])
    love.graphics.draw(defPokemon[wildPokemon][1], opponentXY[1], opponentFinalXY[2])
    love.graphics.draw(defPokemon[wildPokemon][1], playerXY[1], playerFinalXY[2])
end