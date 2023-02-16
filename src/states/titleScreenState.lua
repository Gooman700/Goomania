--STATE TO DRAW MAIN MENU AND TAKE INPUT TO PUSH LOAD STATE
titleScreenState = {}
local timer = 0 -- timer for flashing text

function titleScreenState:enter()
  timer = 0
  gSounds["menuMusic"]:play()
end

function titleScreenState:exit()
  love.audio.stop(gSounds["menuMusic"])
  pushState(fadeOutState)
end

-- Update the menu state
function titleScreenState:update(dt)
  
  timer = timer + dt

  if love.keyboard.wasPressed("escape") then
    love.event.quit()
  end

  if love.keyboard.wasPressed("return") then
    love.audio.play(gSounds["select"])
    pushState(mainMenuState)
  end

end

-- Draw the menu state
function titleScreenState:draw()

  --width and height of the slate textured background image in pixels
  local backgroundWidth = gTextures["background"]:getWidth()
  local backgroundHeight = gTextures["background"]:getHeight()

  love.graphics.draw(gTextures["background"],0,0, --drawable, x and y
  0, -- rotation amount
  GAME_WIDTH/backgroundWidth, GAME_HEIGHT/backgroundHeight) --scale factor to get image to fill the screen

  --width and height of the text image
  local titleTextWidth = gTextures["titleText"]:getWidth()
  local titleTextHeight = gTextures["titleText"]:getHeight()

  love.graphics.draw(gTextures["titleText"],--draw the curved writing
  GAME_WIDTH/2-titleTextWidth/2,--centered horizontally
  GAME_HEIGHT/2-titleTextHeight/2)--centered vertically
  
  love.graphics.setFont(gFonts["large"])


  if timer > 0.5 then
    if timer > 1 then
      timer = 0
    end

    local text = "Press Enter To Play!"
    centerText(text,10,150)
  end
  
end