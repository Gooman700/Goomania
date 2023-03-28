switchGoomonState = {}

local x
local y
local width
local height

function switchGoomonState:enter()
    x = 400
    y = 100
    width = 1920 - 800
    height = 1080 - 200
end

function switchGoomonState:exit()end

function switchGoomonState:update(dt)end

function switchGoomonState:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', x, y, width, height, 3)
    love.graphics.setColor(0.65, 0.91, 0.87)
    love.graphics.rectangle('fill', x + 6, y + 6, width - 12, height - 12, 3)
    love.graphics.setColor(1, 1, 1)

    --print on the left column
    for i = 1, math.min(3, #playerParty) do
        panel(x + 6, y + 6 + ((i-1)*height/3), - 6 + width/2, -4 + height/3)
        love.graphics.draw(defGoomon[playerParty[i].name]["image"], x + 6 + 10, y - 40 + ((i-1)*height/3), 0, 0.8, 0.8)

        love.graphics.setColor(0,0,0)
        love.graphics.print(string.upper(playerParty[i].name), x + 200, y + 30 + ((i-1)*height/3))
        love.graphics.print("Level: "..playerParty[i].level, x + 200, y + 100 + ((i-1)*height/3))

        love.graphics.print("HP:", x + 200, y + 170 + ((i-1)*height/3))
        --White inner box for health
        love.graphics.setColor(1,1,1)
        love.graphics.rectangle("fill", x + 200, y + 220 + ((i-1)*height/3), 200, 20)
        --Green health indicator
        love.graphics.setColor(0,1,0)
        love.graphics.rectangle("fill", x + 200, y + 220 + ((i-1)*height/3), 200 * (playerParty[i].health/playerParty[i].maxHealth), 20)
        --Black outline on health bar
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", x + 200, y + 220 + ((i-1)*height/3), 200, 20)
        love.graphics.setColor(1,1,1)
        love.graphics.setColor(1,1,1)
    end

    --print on the right column
    if #playerParty > 3 then
        for i = 4, #playerParty do
            panel(x + 6 + - 6 + width/2, y + 6 + ((i-4)*height/3), - 6 + width/2, -4 + height/3)
            love.graphics.draw(defGoomon[playerParty[i].name]["image"],x + 6 + 10 - 6 + width/2, y - 40 + ((i-4)*height/3), 0, 0.8, 0.8)

            love.graphics.setColor(0,0,0)
            love.graphics.print(string.upper(playerParty[i].name), x + 200 - 6 + width/2, y + 30 + ((i-4)*height/3))
            love.graphics.print("Level: "..playerParty[i].level, x + 200 - 6 + width/2, y + 100 + ((i-4)*height/3))

            love.graphics.print("HP:", x + 200 - 6 + width/2, y + 170 + ((i-4)*height/3))
            --White inner box for health
            love.graphics.setColor(1,1,1)
            love.graphics.rectangle("fill", x + 200 - 6 + width/2, y + 220 + ((i-4)*height/3), 200, 20)
            --Green health indicator
            love.graphics.setColor(0,1,0)
            love.graphics.rectangle("fill", x + 200 - 6 + width/2, y + 220 + ((i-4)*height/3), 200 * (playerParty[i].health/playerParty[i].maxHealth), 20)
            --Black outline on health bar
            love.graphics.setColor(0,0,0)
            love.graphics.rectangle("line", x + 200 - 6 + width/2, y + 220 + ((i-4)*height/3), 200, 20)
            love.graphics.setColor(1,1,1)
            love.graphics.setColor(1,1,1)
            love.graphics.setColor(1,1,1)
        end
    end

end