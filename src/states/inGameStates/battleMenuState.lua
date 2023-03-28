battleMenuState = {}

local choice
local text = {"Fight", "Run"}

function battleMenuState:enter()
    choice = 1
end

function battleMenuState:exit()end

function battleMenuState:update(dt)
    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then        
        if choice == 1 then
            if playerParty[1].speed > wildGoomon.speed then
                pushState(attackState, {playerParty[1], wildGoomon, "player"})
            else
                pushState(attackState, {wildGoomon, playerParty[1], "wild"})
            end
        elseif choice == 2 then
            pushState(fadeOutState, {playState, "b"})        
        elseif choice == 3 then

        elseif choice == 4 then
            
        end
    end
end

function battleMenuState:draw()

    --WILD GOOMON PANEL
    panel(1100, 30, 700, 250)
    love.graphics.setColor(0,0,0)
    love.graphics.print(string.upper(wildGoomon.name), 1150, 50)
    love.graphics.print("Level: " .. wildGoomon.level, 1450, 50)
    love.graphics.print("HP:", 1150, 150)
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


    --PLAYER GOOMON PANEL
    panel(100, 300, 700, 250)
    love.graphics.setColor(0,0,0)
    love.graphics.print(string.upper(playerParty[1].name), 150, 320)
    love.graphics.print("Level: " .. playerParty[1].level, 450, 320)
    love.graphics.print("HP:", 150, 420)
    --White inner box for health
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", 200, 470, 500, 40)
    --Green health indicator
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", 200, 470, 500 * (playerParty[1].health/playerParty[1].maxHealth), 40)
    --Black outline on health bar
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("line", 200, 470, 500, 40)
    love.graphics.setColor(1,1,1)

    selectionTextBox(text, 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8, choice)

end