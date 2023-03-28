switchGoomonState = {}

function switchGoomonState:enter()end

function switchGoomonState:exit()end

function switchGoomonState:update(dt)end

function switchGoomonState:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', 400, 300, 1920-800, 1080-600, 3)
    love.graphics.setColor(0.65, 0.91, 0.87)
    love.graphics.rectangle('fill', 400 + 6, 300 + 6, 1920-800 - 12, 1080-600 - 12, 3)
    love.graphics.setColor(1, 1, 1)
end