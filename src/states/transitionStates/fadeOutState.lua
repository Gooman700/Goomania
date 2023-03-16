fadeOutState = {}
local timer = 0
local timeToFade
local opacity = 0
local nextState
local colour
local stateType
local newParams

function fadeOutState:enter(params)
    timeToFade = 0.5
    nextState = params[1]
    colour = params[2]
    timer = 0
    opacity = 0
    stateType = "clear"
    newParams = nil

    --if the transition wants a specific time to fade
    if params[3] then 
        timeToFade = params[3]
    end

    --if the transition has parameters to pass to the new state
    if params.newParams then
        newParams = params.newParams
    end

    --normally fade states clear the stack, but this will optionally push the new state
    if params.stateType then
        stateType = params.stateType
    end
end

function fadeOutState:update(dt)
    opacity = math.max(0, opacity + (1/timeToFade)*dt)
    timer = timer + dt

    if timer > timeToFade then
        if stateType == "clear" then
            clearState(nextState, newParams)
        elseif stateType == "push" then
            changeState(nextState, newParams)
        end
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