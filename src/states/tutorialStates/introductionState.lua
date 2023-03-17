introductionState = {}

local stage

function introductionState:enter()
    stage = 1
    pushState(fadeInState, "b")
end

function introductionState:exit()end

function introductionState:update(dt)
    if love.keyboard.wasPressed("return") then
        stage = stage + 1
    end

    if stage == 5 then
        pushState(fadeOutState, {chooseGoomonState, "b"})
    end

    if love.keyboard.wasPressed("escape") then
        pushState(confirmState, {"Are you sure you want to skip?", fadeOutState, chooseGoomonState, "b"})
    end
end

function introductionState:draw()
    love.graphics.setFont(gFonts["medium"])
    love.graphics.print("Press escape to skip", 0, GAME_HEIGHT-18)

    love.graphics.setFont(gFonts["large"])
    if stage == 1 then
        centerText("Welcome to the world of Goomania!", 32)
    elseif stage == 2 then
        centerText("This world is inhabited by small creatures named Goomons.", 32)
    elseif stage == 3 then
        centerText("You have just reached the age required to own a Goomon.", 32)
    elseif stage == 4 then
        centerText("For your birthday, your mum has organised you to pick your very own Goomon.", 32)
    end
end