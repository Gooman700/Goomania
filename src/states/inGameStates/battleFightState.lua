battleFightState = {}


function battleFightState:enter()
    pushState(battleMenuState)
end

function battleFightState:exit()
    gSounds["battleMusic"]:stop()
    gSounds["fieldMusic"]:play()
end

function battleFightState:update(dt)end

function battleFightState:draw()
    love.graphics.setShader()

    love.graphics.draw(gTextures["battleScene"], 0, 0)
    love.graphics.draw(defGoomon[wildGoomon.name].image, 2*(GAME_WIDTH/3), 250)
    love.graphics.draw(defGoomon[playerParty[1].name].backImage, GAME_WIDTH/4-115, GAME_HEIGHT-100-400)
end