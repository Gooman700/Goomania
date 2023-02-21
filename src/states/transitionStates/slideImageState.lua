slideImageState = {}
local image
local x
local y
local direction
local time
local finalX
local finalY
local timer
local step

--params list would be image, x, y, direction of slide and time to slide
function slideImageState:enter(params)
    image = params[1]
    finalX = params[2]
    finalY = params[3]
    direction = params[4]
    time = params[5]
    timer = 0

    if direction == "left" then
        x = GAME_WIDTH
        y = finalY
    elseif direction == "right" then
        x = 0
        y = finalY
    elseif direction == "up" then
        x = finalX
        y = GAME_HEIGHT
    else
        x = finalX
        y = 0
    end

    stepX = lerp(x, finalX, time)
    stepY = lerp(y, finalY, time)
end

function slideImageState:exit()end

function slideImageState:update(dt)
    timer = timer + dt
    local progress = math.min(timer/time, 1)

    x = lerp(x, finalX, progress)
    y = lerp(y, finalY, progress)
    
    if timer > time then
        popState()
    end
end

function slideImageState:draw()
    love.graphics.print(tostring(x,0,500))
    love.graphics.draw(image, x, y, 0, 8, 8)
end