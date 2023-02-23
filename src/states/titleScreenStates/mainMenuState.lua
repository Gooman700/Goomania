--STATE TO TAKE IN INPUT AND PUSH THE CORRESPONDING STATE ACCORDINGLY
mainMenuState = {}
local choice = 1
local text = {"Load Game", "New Game", "Settings"}

function mainMenuState:enter()end
function mainMenuState:exit()end

function mainMenuState:update(dt)
    if love.keyboard.wasPressed("escape") then
        popState()
    end
    
    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then
        
        --using if statement as there are only 3 outcomes
        if choice == 1 then
            if love.filesystem.getInfo("gooSave.json") == nil then
                love.graphics.setFont(gFonts["extraLarge"])
                pushState(confirmState, {"No save detected, do you want to create a new one?", fadeOutState, newSaveState, "b"})
            else
                pushState(fadeOutState, {loadSaveState, "b"})
            end
        elseif choice == 2 then
            pushState(confirmState, {"Creating a new save will overwrite your old one, are you sure you wish to continue?", fadeOutState, newSaveState, "b"})
        else
            pushState(settings)
        end 
    end
end


function mainMenuState:draw()
    love.graphics.setFont(gFonts["large"])

    selectionTextBox(text, GAME_WIDTH/4, 3*GAME_HEIGHT/4, GAME_WIDTH/2, 200, choice)
end