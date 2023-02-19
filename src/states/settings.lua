settings = {}
local text = {"Volume"}
local choice = 1

function settings:enter()end
function settings:exit()end

function settings:update(dt)
    if love.keyboard.wasPressed("escape") then
        popState()
    end

    choice = menuInput(text, choice)

    if love.keyboard.wasPressed("return") then
        if choice == 1 then
            changeState(volume)
        end
    end
end

function settings:draw()
    love.graphics.setFont(gFonts["large"])

    selectionTextBox(text, GAME_WIDTH/4, 3*GAME_HEIGHT/4, GAME_WIDTH/2, 200, choice)
end