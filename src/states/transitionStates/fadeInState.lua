fadeInState = {}
local timer = 0
local timeToFade
local opacity = 1
local colour
local nextState
local newParams

function fadeInState:enter(params)
    colour = params
    timer = 0
    opacity = 1
    timeToFade = 0.5
    nextState = nil
    newParams = nil

    if params.newParams then
        newParams = params.newParams
    end

    if params.nextState then
        nextState = params.nextState
    end

    if params[2] then
        timeToFade = params[2]
        colour = params[1]
    end
end
function fadeInState:update(dt)
    opacity = math.max(0, opacity - (1/timeToFade)*dt)
    timer = timer + dt

    if timer > timeToFade then
        if nextState then
            changeState(nextState, newParams)
        else
            popState()
        end
    end
end
function fadeInState:draw()
    if colour == "b" then
        love.graphics.setColor(0,0,0,opacity)
    else
        love.graphics.setColor(1,1,1,opacity)
    end
    love.graphics.rectangle("fill",0,0,GAME_WIDTH,GAME_HEIGHT)
end
function fadeInState:exit()end