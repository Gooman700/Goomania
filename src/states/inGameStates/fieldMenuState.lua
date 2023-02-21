fieldMenuState = {}
local choice = 1
local text = {"Save", "Exit"}

function fieldMenuState:enter()end

function fieldMenuState:exit()end

function fieldMenuState:update(dt)
    if love.keyboard.wasPressed("escape") then
        popState()
    end
    
    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then        
        if choice == 1 then
            changeState(saveState)
        elseif choice == 2 then
            pushState(fieldExitState)
        end
    end
end

function fieldMenuState:draw()
    love.graphics.setFont(gFonts["large"])

    selectionTextBox(text, GAME_WIDTH/4, 3*GAME_HEIGHT/4, GAME_WIDTH/2, 200, choice)
end