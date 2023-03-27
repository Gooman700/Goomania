attackState = {}

--timer for getting the correct speed of enemy flashing to demonstrate attack
local flashTimer

--timer for the different stages of the attack state
local eventTimer

local attacker, defender, turn

--stores the new health of the Goomon after the attack, acts as the endpoint for the healthbar.
local currentHealth

local criticalHit

function attackState:enter(params)

    attacker = params[1]
    defender = params[2]
    turn = params[3]

    --damage calculation, function is at the bottom.
    currentHealth = damageCalc(attacker, defender)

    flashTimer, eventTimer = 0, 0
end

function attackState:exit()end

function attackState:update(dt)
    
    flashTimer = flashTimer + dt
    eventTimer = eventTimer + dt

    if eventTimer > 1.8 then
        --linear scaling of the health, makes the healthbar lower at a constant rate
        defender.health = math.max(0, math.max(currentHealth, defender.health - 20 * dt))
    end

    if defender.health == 0 then
        if turn == "player" then
            -- if the knocked out Goomon is the players, check if all their party is knocked out, if so, send them to the defeat screen
            for i = 1, #playerParty do
                local alive = true
                if playerParty[i].health > 0 then
                    alive = true
                    break
                else
                    alive = false
                end
            end

            if alive == false then
                changeState(defeatState)
            else
                popState()
            end
        else
            popState()
        end
    elseif defender.health == currentHealth then
        if criticalHit == 2 then
            
        else
            popState()
        end
    end
end

function attackState:draw()

    if turn == "player" then
        --White inner box for health
        love.graphics.setColor(1,1,1)
        love.graphics.rectangle("fill", 1200, 200, 500, 40)
        --Green health indicator
        love.graphics.setColor(0,1,0)
        love.graphics.rectangle("fill", 1200, 200, 500 * (defender.health/defender.maxHealth), 40)
        --Black outline on health bar
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line", 1200, 200, 500, 40)
        love.graphics.setColor(1,1,1)
    end

    if eventTimer > 1 and eventTimer < 1.8 then
        if flashTimer > 0.2 then
            love.graphics.setShader(whiteoutShader)
            if flashTimer > 0.4 then
                flashTimer = 0
                love.graphics.setShader()
            end
        end
        
        if turn == "player" then
            love.graphics.draw(defGoomon[defender.name].image, 2*(GAME_WIDTH/3), 250)
        else
            love.graphics.draw(defGoomon[defender.name].backImage, GAME_WIDTH/4-115, GAME_HEIGHT-100-400)
        end
    end

    love.graphics.setShader()
    textBox(string.upper(attacker.name) .. " attacked " .. string.upper(defender.name), 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8)
    
end

function damageCalc(attacker, defender)

    --1 in 4 chance for the attack to be a critical hit, dealing twice the damage
    criticalHit = math.random(1,4)
    if criticalHit == 4 then
        criticalHit = 2 
    else
        criticalHit = 1
    end

    currentHealth = defender.health - (criticalHit*attacker.attack*(attacker.attack/defender.defense))
    return currentHealth
end