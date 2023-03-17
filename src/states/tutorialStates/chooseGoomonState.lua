chooseGoomonState = {}

local text = {"Empurr", "Sweep", "Scrappy"}
local choice

function chooseGoomonState:enter()
    choice = 1

    pushState(fadeInState, "b")
end

function chooseGoomonState:exit()end

function chooseGoomonState:update(dt)
    choice = menuInput(text, choice)

    if love.keyboard.wasPressed("return") then
        pushState(newSaveState, string.lower(text[choice]))
    end
end

function chooseGoomonState:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.draw(gTextures["tutorialBG"], 0, 0)

    love.graphics.setFont(gFonts["large"])

    selectionTextBox(text, GAME_WIDTH/4, 3*GAME_HEIGHT/4, GAME_WIDTH/2, 200, choice)

    love.graphics.setFont(gFonts["large"])
    if choice == 1 then
        panel(100, 150, 500, 500)
        love.graphics.draw(gTextures["empurr"], 800, 0, 0, 2, 2)
        love.graphics.setColor(0,0,0)
        love.graphics.printf("Empurr is a fiesty cat with a firey temper. When under threat or on the attack, fire will ignite along their spine and tail, as a warning to enemies. They can become attached to one person, and will protect that person with their lives. Overall a loyal and powerful friend.", 100+20, 200, 500-30)
    elseif choice == 2 then
        panel(100, 150, 500, 500)
        love.graphics.draw(gTextures["sweep"], 800, 0, 0, 2, 2)
        love.graphics.setColor(0,0,0)
        love.graphics.printf("Sweep is a mischievous little broom who pulls pranks on whoever is lucky enough to meet them. They use their bristle to detect movement in the air around them, leading to them being very difficult to sneak up on.", 100+20, 200, 500-30)
    else
        panel(100, 150, 500, 500)
        love.graphics.draw(gTextures["scrappy"], 800, 0, 0, 2, 2)
        love.graphics.setColor(0,0,0)
        love.graphics.printf("Scrappy was born out of a robotic lab when one scientist managed to crack the code to self sufficient AI. Since then, they've been upgrading and rewriting their own code to gain the best advantage over their enemies as possible.", 100+20, 200, 500-30)
    end
end