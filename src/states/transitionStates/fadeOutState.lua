fadeOutState = {}
local timer = 0
local timeToFade = 0.5
local opacity = 0
local nextState
local colour

function fadeOutState:enter(params)
    nextState = params[1]
    colour = params[2]
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
    if colour == "b" then
        love.graphics.setColor(0,0,0,opacity)
    else
        love.graphics.setColor(1,1,1,opacity)
    end
    love.graphics.rectangle("fill",0,0,GAME_WIDTH,GAME_HEIGHT)
end

function fadeOutState:exit()end