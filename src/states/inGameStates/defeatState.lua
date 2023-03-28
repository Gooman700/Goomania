defeatState = {}

local timer

function defeatState:enter()
    timer = 0 
end

function defeatState:exit()end

function defeatState:update(dt)
    timer = timer + dt

    if timer > 1.5 then
        pushState(fadeOutState, {playState, "b"})
    end
end

function defeatState:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", 0, 0, GAME_WIDTH, GAME_HEIGHT)
    love.graphics.setColor(1,1,1)
    centerText("All your Goomon have been knocked out. You lost this battle.")
end