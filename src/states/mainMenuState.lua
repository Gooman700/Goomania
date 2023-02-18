--STATE TO TAKE IN INPUT AND PUSH THE CORRESPONDING STATE ACCORDINGLY
mainMenuState = {}
local choice = 1
local text = {"New Game", "Load Game", "Settings"}

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
            pushState(confirmState, {fadeOutState, loadSaveState})
        elseif choice == 2 then
            clearState(loadSaveState)
        else
            pushState(settings)
        end 
    end
    
end


function mainMenuState:draw()
    love.graphics.setFont(gFonts["large"])

    selectionTextBox(text, GAME_WIDTH/4, 3*GAME_HEIGHT/4, GAME_WIDTH/2, 200, choice)
end