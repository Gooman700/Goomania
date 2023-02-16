confirmState = {}
local nextState
local choice = 1
local text = {"Yes", "No"}

--takes in the state that is to be next pushed if the confirmation is positive
function confirmState:enter(params)
    nextState = params
    print("confirm enter")
end
function confirmState:exit()
end

function confirmState:update(dt)
    if love.keyboard.wasPressed("escape") then
        popState()
    end

    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then
        
        if choice == 1 then
            clearState(nextState)
        elseif choice == 2 then
            popState()
        end

    end
end

function confirmState:draw()
    love.graphics.setFont(gFonts["large"])

    selectionTextBox(text, GAME_WIDTH/4, GAME_HEIGHT/2, GAME_WIDTH/2, 200, choice)
end