integration = {}

function integration:enter()

end

function integration:exit()

end

function integration:update(dt)
    if love.keyboard.wasPressed("escape") then
        popState()
    end
end

function integration:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",0,0,GAME_WIDTH,GAME_HEIGHT)
    love.graphics.setColor(1,1,1)

    love.graphics.setFont(gFonts["large"])
    centerText("Integration Testing")
end