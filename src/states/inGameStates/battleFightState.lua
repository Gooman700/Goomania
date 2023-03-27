battleFightState = {}

local choice
local text = {"Fight", "Switch", "Items", "Run"}

function battleFightState:enter()
    choice = 1
end

function battleFightState:exit()
    gSounds["battleMusic"]:stop()
    gSounds["fieldMusic"]:play()
end

function battleFightState:update(dt)
    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then        
        if choice == 1 then
            if playerGoomon.speed > wildGoomon.speed then
                pushState(attackState, {playerGoomon, wildGoomon, "player"})
            else
                pushState(attackState, {wildGoomon, playerGoomon, "wild"})
            end
        elseif choice == 2 then
            
        elseif choice == 3 then

        elseif choice == 4 then
            popState()
        end
    end
end

function battleFightState:draw()
    love.graphics.setShader()

    love.graphics.draw(gTextures["battleScene"], 0, 0)
    love.graphics.draw(defGoomon[wildGoomon.name].image, 2*(GAME_WIDTH/3), 250)
    love.graphics.draw(defGoomon[playerGoomon.name].backImage, GAME_WIDTH/4-115, GAME_HEIGHT-100-400)

    --White inner box for health
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", 1200, 200, 500, 40)
    --Green health indicator
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", 1200, 200, 500 * (wildGoomon.health/wildGoomon.maxHealth), 40)
    --Black outline on health bar
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line", 1200, 200, 500, 40)
    love.graphics.setColor(1,1,1)

    selectionTextBox(text, 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8, choice)
end