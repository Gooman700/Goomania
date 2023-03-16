chooseGoomonState = {}

local text = {"Sweep", "Empurr", "Scrappy"}

function chooseGoomonState:enter()
    pushState(fadeInState, "b")
end

function chooseGoomonState:exit()end

function chooseGoomonState:update(dt)end

function chooseGoomonState:draw()
    love.graphics.draw(gTextures["tutorialBG"], 0, 0)
end