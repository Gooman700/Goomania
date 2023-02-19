fadeOutState = {}
local timer = 0
local timeToFade = 0.5
local opacity = 0
local nextState

function fadeOutState:enter(state)
    nextState = state
    timer = 0
    opacity = 0
end

function fadeOutState:update(dt)
    opacity = math.max(0, opacity + (1/timeToFade)*dt)
    timer = timer + dt

    if timer > timeToFade then
        clearState(nextState)
    end
end

function fadeOutState:draw()
    love.graphics.setColor(0,0,0,opacity)
    love.graphics.rectangle("fill",0,0,GAME_WIDTH,GAME_HEIGHT)
end

function fadeOutState:exit()end