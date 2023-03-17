--FILE THAT LINKS EVERYTHING TOGETHER USING THE STATESTACK

--require all files for the game
require("src/dependencies")

function love.load()--executed at the start of the program

    --if its the first time playing and there is no settings file, create one with the default values.
    if not love.filesystem.getInfo("gooSettings.json") then
        local defaultSettings = {volume = 0.5}
        local rawSettings = json:encode(defaultSettings)
        love.filesystem.write("gooSettings.json", rawSettings)
    end

    --Get the last used volume from the settings save file and set the current volume to it
    local rawSettings = love.filesystem.read("gooSettings.json")
    gSettings = json:decode(rawSettings)
    love.audio.setVolume(gSettings.volume)

    push:setupScreen(GAME_WIDTH, GAME_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {fullscreen = true})

    -- set love"s default filter to "nearest-neighbor", which essentially
    -- means there will be no filtering of pixels (blurriness), which is
    -- important for a nice crisp, 2D look
    love.graphics.setDefaultFilter("nearest", "nearest")

    math.randomseed(os.time())

    pushState(titleScreenState)
    love.keyboard.keysPressed = {}
end


function love.update(dt)
    
    --current state = the last element of the stateStack table - # means length of
    currentState = stateStack[#stateStack]
    currentState:update(dt)

    --reset the keys pressed table
    love.keyboard.keysPressed = {}

end


function love.draw()--all the rendering needed for each frame
    push:start()
    
    love.graphics.setColor(1,1,1,1)

    for i, state in ipairs(stateStack) do
        if state:draw() then
          state:draw()
        end
    end

    push:finish()
end

--by incerementing the variable when a key is pressed and decrementing it when that key is released, i can use this to check if ANY keys are down
anyKeyPressed = 0
function love.keypressed(key)
    anyKeyPressed = anyKeyPressed + 1
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.keyreleased(key)
    anyKeyPressed = anyKeyPressed - 1
end