fadeInState = {}
local timer = 0
local timeToFade = 1
local opacity = 1

function fadeInState:enter()
    timer = 0
    opacity = 1
end
function fadeInState:update(dt)
    opacity = math.max(0, opacity - dt)
    timer = timer + dt

    if timer > timeToFade then
        popState()
    end
end
function fadeInState:draw()
    love.graphics.setColor(0,0,0,opacity)
    love.graphics.rectangle("fill",0,0,GAME_WIDTH,GAME_HEIGHT)
end
function fadeInState:exit()end