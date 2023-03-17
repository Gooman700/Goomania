volume = {}

local rightTimer
local leftTimer

function volume:enter()
    rightTimer = 0
    leftTimer = 0
end
function volume:exit()end

function volume:update(dt)
    if love.keyboard.wasPressed("d") or love.keyboard.wasPressed("right") then
        gSettings.volume = math.min(1, gSettings.volume + 0.05)

        love.audio.setVolume(gSettings.volume)
    end

    if love.keyboard.wasPressed("a") or love.keyboard.wasPressed("left") then
        gSettings.volume = math.max(0, gSettings.volume - 0.05)

        love.audio.setVolume(gSettings.volume)
    end

    --if the user holds down the button, after a second, the bar moves much quicker
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        rightTimer = rightTimer + dt
        if rightTimer > 0.5 then
            gSettings.volume = math.min(1, gSettings.volume + 0.005)
            love.audio.setVolume(gSettings.volume)
        end
    else
        rightTimer = 0
    end

    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        leftTimer = leftTimer + dt
        if leftTimer > 0.5 then
            gSettings.volume = math.max(0, gSettings.volume - 0.005)
            love.audio.setVolume(gSettings.volume)
        end
    else
        leftTimer = 0
    end

    if love.keyboard.wasPressed("escape") or love.keyboard.wasPressed("return") then
        local rawSettings = json:encode(gSettings)
        love.filesystem.write("gooSettings.json", rawSettings)

        popState()
    end
end

function volume:draw()
    panel(GAME_WIDTH/4, 3*GAME_HEIGHT/4, GAME_WIDTH/2, 200)

    --print out current volume level
    love.graphics.setColor(0,0,0)
    love.graphics.print(math.floor(gSettings.volume*100), 1250, 875)

    --draw back line for volume slider
    love.graphics.rectangle("fill", 600, 900, 500, 3)

    --draw square slider at current volume level
    love.graphics.setColor(0.455, 0.729, 0.969)
    love.graphics.rectangle("fill", 600 + (gSettings.volume)*485, 885, 30, 30)
end