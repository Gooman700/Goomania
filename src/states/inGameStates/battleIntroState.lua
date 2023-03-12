battleIntroState = {}
local wildPokemon

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

    --select the wild pokemon as one of the pokemon that can spawn in the current route
    wildPokemon = routeOne["wildPokemon"][math.random(1, #routeOne["wildPokemon"])]
    --select the players first pokemon in their party to be their first to battle
    playerPokemon = playerParty[1]

    panelXY = {0, GAME_HEIGHT}
    panelFinalXY = {0, 0}

    opponentXY = {GAME_WIDTH, 100}
    opponentFinalXY = {2*(GAME_WIDTH/3), 250}

    playerXY = {-400, GAME_HEIGHT-100}
    playerFinalXY = {GAME_WIDTH/4-100, GAME_HEIGHT-100-400}

end

function battleIntroState:exit()end

function battleIntroState:update(dt)
    if timer < timeToComplete then 
        timer = timer + dt
        panelXY = slideImageUpdate(panelXY, panelFinalXY, timer, timeToComplete, dt)
        opponentXY = slideImageUpdate(opponentXY, opponentFinalXY, timer,timeToComplete, dt)
        playerXY = slideImageUpdate(playerXY, playerFinalXY, timer, timeToComplete, dt)
    else
        changeState(battleFightState, {wildPokemon})
    end
end

function battleIntroState:draw()
    love.graphics.draw(gTextures["battleScene"], 0, panelXY[2])
    love.graphics.draw(defPokemon[wildPokemon].image, opponentXY[1], opponentFinalXY[2])
    love.graphics.draw(defPokemon[playerPokemon.name].backImage, playerXY[1], playerFinalXY[2])
end