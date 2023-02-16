--GENERALISED STATE WHEREBY TEXT BOX IS PRINTED, WHEN INPUT DETECTED IS REMOVED
textState = {}
local values = {}

--in the case of calling this state, params will be a table with text, x, y, width, and height
function textState:enter(params)
    for i = 1, #params do
        values[i] = params[i]
    end
end

function textState:exit()end

function textState:update(dt)
    if love.keyboard.wasPressed("return") then
        popState()
    end
end

function textState:draw()
    love.graphics.setFont(gFonts["medium"])
    panel(values[2],values[3],values[4],values[5])

    love.graphics.setColor(0,0,0)
    love.graphics.printf(values[1], values[2], values[3], values[4])
    love.graphics.setColor(1,1,1)
end