victoryState = {}

local timer

function victoryState:enter()end

function victoryState:exit()end

function victoryState:update(dt)
    timer = timer + dt

    if timer > 1.5 then
        pushState(fadeOutState, {playState, "b"})
    end
end

function victoryState:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", 0, 0, GAME_WIDTH, GAME_HEIGHT)
    love.graphics.setColor(0,0,0)
    centerText("The enemy Goomon has been knocked out. You won this battle!")
end