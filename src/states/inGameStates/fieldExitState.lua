fieldExitState = {}
local choice = 1
local text = {"Exit to Main Menu", "Exit to Desktop"}

function fieldExitState:enter()end
function fieldExitState:exit()end

function fieldExitState:update(dt)
    if love.keyboard.wasPressed("escape") then
        popState()
    end
    
    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then        
        if choice == 1 then
            clearState(titleScreenState)
        elseif choice == 2 then
            pushState(confirmState, {quitState})
        end
    end
end

function fieldExitState:draw()
    love.graphics.setFont(gFonts["large"])

    selectionTextBox(text, GAME_WIDTH/4, 3*GAME_HEIGHT/4, GAME_WIDTH/2, 200, choice)
end