confirmState = {}
local firstState
local choice = 1
local text = {"Yes", "No"}
local popUp -- the text to pop up with the yes no selection

--takes in the state that is to be next pushed if the confirmation is positive
function confirmState:enter(params)
    choice = 1
    popUp = params[1]
    firstState = params[2]
    secondState = params[3]
    thirdParam = params[4]
end
function confirmState:exit()
    if love.keyboard.wasPressed("return") then

        if choice == 1 then
            if secondState then
                pushState(firstState, {secondState, thirdParam})
            else
                clearState(firstState)
            end
        end

    end
end

function confirmState:update(dt)

    if love.keyboard.wasPressed("escape") then
        popState()
    end

    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then
        popState()
    end
end

function confirmState:draw()
    love.graphics.setFont(gFonts["large"])

    panel(GAME_WIDTH/4, 250, GAME_WIDTH/2, 200)

    love.graphics.setColor(0,0,0)
    love.graphics.printf(popUp, (GAME_WIDTH/4)+20, 270, (GAME_WIDTH/2)-24)
    love.graphics.setColor(1,1,1)

    selectionTextBox(text, GAME_WIDTH/4, GAME_HEIGHT/2, GAME_WIDTH/2, 200, choice)
end