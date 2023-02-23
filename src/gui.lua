--ALL GUI RELATED FUNCTIONS TO DRAW MENUS AND TEXT

function panel(x,y,width,height)
    love.graphics.setColor(0.65, 0.91, 0.87)
    love.graphics.rectangle('fill', x, y, width, height, 3)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', x + 6, y + 6, width - 12, height - 12, 3)
    love.graphics.setColor(1, 1, 1)
end

function selectionTextBox(text, x, y , width, height, choice)

    --create the background panel for the text to go on
    panel(x, y ,width, height)

    love.graphics.setColor(0,0,0)
    for i = 1, #text do
        --print each option in the middle of the panel, and horizotally make them equal length apart by dividing the width of the panel by how many options there are
        --if choice = the current index of the text table, draw that word in orange
        if choice == i then
            love.graphics.setColor(1,0.55,0.02)
        end
        love.graphics.print(text[i], x-100+(i*(width/(#text+1))), y-32+(height/2))
        love.graphics.setColor(0,0,0)
    end
    love.graphics.setColor(1,1,1)

end

--function to take in the left/right input to edit which option is highlighted
function menuInput(text, choice)
    --If A or D (left or right) are pressed, change the highlighted word.
    if love.keyboard.wasPressed("d") or love.keyboard.wasPressed("right") then
        choice = math.min(#text,choice+1)
    elseif love.keyboard.wasPressed("a") or love.keyboard.wasPressed("left") then
        choice = math.max(1,choice-1)
    end

    return choice
end

function slideImageUpdate(XY, finalXY, timer, time, dt)
    local progress = math.min(timer/time, 1)

    XY[1] = lerp(XY[1], finalXY[1], progress)
    XY[2] = lerp(XY[2], finalXY[2], progress)

    return XY
end