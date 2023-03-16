--FILE FOR ALL THE USEFUL FUNCTIONS THAT MAKE LIFE EASIER


function centerText(text,fontSize,height)
    local textWidth = love.graphics.getFont():getWidth(text)
    local x = GAME_WIDTH / 2 - textWidth / 2
    local y = height or GAME_HEIGHT / 2

    love.graphics.print(text, x, y)
end

--for a given atlas (tileSheet), split it up into quads tileWidth wide and tileHeight tall, storing them in the table tiles
function generateQuads(atlas, tileWidth, tileHeight)
    local tiles = {}
    local sheetCounter = 1
    local sheetWidth = atlas:getWidth()
    local sheetHeight = atlas:getHeight()

    for y = 0, (sheetHeight/tileHeight)-1 do
        for x = 0, (sheetWidth/tileWidth)-1 do
            tiles[sheetCounter] = love.graphics.newQuad(x*tileWidth, y*tileHeight, tileWidth, tileHeight, atlas)
            sheetCounter = sheetCounter + 1
        end
    end

    return tiles
end

--update the player map list
function moveMap(mapX, mapY)
    for y = 1, playerMap.height do
        for x = 1, playerMap.length do
            playerMap["floor"][y][x] = routeOne["floor"][mapY + y][mapX + x]
            playerMap["collision"][y][x] = routeOne["collision"][mapY + y][mapX + x]
            playerMap["interaction"][y][x] = routeOne["interaction"][mapY + y][mapX + x]
        end
    end
end

--simple linear interpolation function to give the rate of change of something when trying to go from one value to another in a given time
function lerp(start, finish, time)
    return start + (finish - start) * time/16
end