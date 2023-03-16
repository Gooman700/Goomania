battleFightState = {}

local opponent
local choice
local text = {"Fight", "Switch", "Items", "Run"}

function battleFightState:enter(params)
    opponent = params[1]

    choice = 1
end

function battleFightState:exit()
    gSounds["battleMusic"]:stop()
    gSounds["fieldMusic"]:play()
end

function battleFightState:update(dt)
    choice = menuInput(text, choice)

    --if the player selects that option, return the index of the option to the corresponding state
    if love.keyboard.wasPressed("return") then        
        if choice == 1 then
            
        elseif choice == 2 then
            
        elseif choice == 3 then

        elseif choice == 4 then
            popState()
        end
    end
end

function battleFightState:draw()
    love.graphics.draw(gTextures["battleScene"], 0, 0)
    love.graphics.draw(defPokemon[opponent].image, 2*(GAME_WIDTH/3), 250)
    love.graphics.draw(defPokemon[playerPokemon.name].backImage, GAME_WIDTH/4-115, GAME_HEIGHT-100-400)

    selectionTextBox(text, 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8, choice)
end