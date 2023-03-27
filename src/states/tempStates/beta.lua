beta = {}

function beta:enter()

end

function beta:exit()

end

function beta:update(dt)
    if love.keyboard.wasPressed("escape") then
        popState()
    end
end

function beta:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",0,0,GAME_WIDTH,GAME_HEIGHT)
    love.graphics.setColor(1,1,1)

    love.graphics.setFont(gFonts["large"])
    centerText("beta Testing")
end