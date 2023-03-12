--STATE FOR PLAYER MOVEMENT AND MAP MOVEMENT
playState = {}
local playerSpeed = 200
local direction = 1
local stage = 1
local timer = 0 -- timer for animations
local encounterRate = 0 -- timer for encounters
local isMoving

function playState:enter()
  gSounds["fieldMusic"]:setLooping(true)
  gSounds["fieldMusic"]:play()
  pushState(fadeInState, "b")
end
function playState:exit()
  gSounds["fieldMusic"]:stop()
end

function playState:update(dt)
  
  if love.keyboard.wasPressed("tab") then
    pushState(fieldMenuState)
  end

  --while shift is held, speed increased (sprinting)
  if love.keyboard.isDown("lshift") then
    playerSpeed = 600
  else
    playerSpeed = 200
  end

  isMoving = false

  --IF MOVING LEFT
  if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
    direction = 1
    if playerMap["collision"][1+math.ceil((-tileOffsetY+playerY+100)/64)][1+math.ceil((-tileOffsetX+playerX-(playerSpeed*dt))/64)] == 60 then
      if playerX <= GAME_WIDTH/2 and (mapX > 0 or mapX == 0 and tileOffsetX < 0) then
        isMoving = true
        playerX = GAME_WIDTH/2
        tileOffsetX = math.ceil(tileOffsetX + playerSpeed*dt)
      else
        isMoving = true
        playerX = math.max(playerX - playerSpeed*dt, 0)
      end
    end
  end

  --IF MOVING RIGHT
  if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
    direction = 3
    if playerMap["collision"][1+math.ceil((-tileOffsetY+1+playerY+100)/64)][1+math.ceil((-tileOffsetX+1+playerX+60+(playerSpeed*dt))/64)] == 60 then
      if playerX >= GAME_WIDTH/2 and (mapX < routeOne.length - playerMap.length or mapX == routeOne.length - playerMap.length and tileOffsetX > 0) then
        isMoving = true
        playerX = GAME_WIDTH/2
        tileOffsetX = math.floor(tileOffsetX - playerSpeed*dt)
      else
        isMoving = true
        playerX = math.min(playerX + playerSpeed*dt, GAME_WIDTH-60)
      end
    end
  end

  --IF MOVING UP
  if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
    direction = 0
    --y at +60 instead of +100 to make it look more realistic
    if playerMap["collision"][1+math.ceil((-tileOffsetY+1+playerY+60-(playerSpeed*dt))/64)][1+math.ceil((-tileOffsetX+1+playerX)/64)] == 60 and playerMap["collision"][1+math.ceil((-tileOffsetY+1+playerY+60-(playerSpeed*dt))/64)][1+math.ceil((-tileOffsetX+1+playerX+60)/64)] == 60 then
      if playerY <= GAME_HEIGHT/2 and (mapY > 0 or mapY == 0 and tileOffsetY < 0) then
        isMoving = true
        tileOffsetY = math.ceil(tileOffsetY + playerSpeed*dt)
      else
        isMoving = true
        playerY = math.max(playerY - playerSpeed*dt, 0)
      end
    end
  end

  --IF MOVING DOWN
  if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    direction = 2
    if playerMap["collision"][1+math.ceil((-tileOffsetY+1+playerY+100+(playerSpeed*dt))/64)][1+math.ceil((-tileOffsetX+1+playerX)/64)] == 60 and playerMap["collision"][1+math.ceil((-tileOffsetY+1+playerY+100+(playerSpeed*dt))/64)][1+math.ceil((-tileOffsetX+1+playerX+60)/64)] == 60 then
      if playerY >= GAME_HEIGHT/2 and (mapY < routeOne.height - playerMap.height or mapY == routeOne.height - playerMap.height and tileOffsetY > 0) then
        isMoving = true
        tileOffsetY = math.floor(tileOffsetY - playerSpeed*dt)
      else
        isMoving = true
        playerY = math.min(playerY + playerSpeed*dt, GAME_HEIGHT - 100)
      end
    end
  end

  --if moving, let the moving animations roll, otherwise keep the sprite static
  if isMoving then
    timer = timer + dt

    if timer > 0.2 then
      timer = 0
      stage = stage+1
      if stage==4 then
        stage = 1
      end
    end
  else
    stage = 1
  end
  

  if tileOffsetX > 64 then
    tileOffsetX = 0
    mapX = mapX-1
  elseif tileOffsetX < -64 then
    tileOffsetX = 0
    mapX = mapX+1
  elseif tileOffsetY > 64 then
    tileOffsetY = 0
    mapY = mapY-1
  elseif tileOffsetY < -64 then
    tileOffsetY = 0
    mapY = mapY+1
  end

  if isMoving and (playerMap["interaction"][1+math.ceil((-tileOffsetY+playerY+1+100)/64)][1+math.ceil((-tileOffsetX+playerX+1)/64)] == 52 or playerMap["interaction"][1+math.ceil((-tileOffsetY+playerY+1+100)/64)][1+math.ceil((-tileOffsetX+playerX+60+1)/64)] == 52) then
    encounterRate = encounterRate + dt
    if encounterRate > 2 then
      encounterRate = 0
      gSounds["fieldMusic"]:stop()
      gSounds["battleMusic"]:play()
      pushState(battleIntroState)
    end
  end

  moveMap(mapX, mapY)

end

function playState:draw()

  for y = 1,playerMap.height do
    for x = 1,playerMap.length do
        love.graphics.draw(gTextures["tileSheet"], gFrames["tiles"][playerMap["floor"][y][x]],tileOffsetX+(x-2)*64,tileOffsetY+(y-2)*64)
        love.graphics.draw(gTextures["tileSheet"], gFrames["tiles"][playerMap["collision"][y][x]],tileOffsetX+(x-2)*64,tileOffsetY+(y-2)*64)
        love.graphics.draw(gTextures["tileSheet"], gFrames["tiles"][playerMap["interaction"][y][x]],tileOffsetX+(x-2)*64,tileOffsetY+(y-2)*64)
    end
  end
  
  --using direction and stage of animation, where the spritesheet is split into 16 different images, 60x100 pixels, animate movement using each row of the sheet
  love.graphics.draw(gTextures["spriteSheet"], gFrames["sprites"][direction*4 + stage], playerX, playerY)

end