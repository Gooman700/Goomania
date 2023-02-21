fadeInState = {}
local timer = 0
local timeToFade = 0.5
local opacity = 1
local colour

function fadeInState:enter(params)
    colour = params
    timer = 0
    opacity = 1
end
function fadeInState:update(dt)
    opacity = math.max(0, opacity - (1/timeToFade)*dt)
    timer = timer + dt

    if timer > timeToFade then
        popState()
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