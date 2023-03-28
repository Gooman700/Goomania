attackState = {}

--stage for which part of the attack animation is happeneing, timer for how far through it we are   
local timer
local stage

--timer for the Goomon flashing when taking damage
--stage for which part of the attack animation is happeneing, timer for how far through it we are   
local timer
local stage

--timer for the Goomon flashing when taking damage
local flashTimer

local attacker, defender, turn

--stores the new health of the Goomon after the attack, acts as the endpoint for the healthbar.
local currentHealth

--variable for if the attack was a crit
--variable for if the attack was a crit
local criticalHit

local alive

--both Goomon have to attack, this variable keeps track of if they both have, by being either true or false
local hasAttacked = false

local alive

--both Goomon have to attack, this variable keeps track of if they both have, by being either true or false
local hasAttacked = false

function attackState:enter(params)

    attacker = params[1]
    defender = params[2]
    turn = params[3]


    alive = true
    

    alive = true
    
    --damage calculation, function is at the bottom.
    currentHealth = damageCalc(attacker, defender)

    flashTimer = 0
    timer = 0
    stage = 0
    flashTimer = 0
    timer = 0
    stage = 0
end

function attackState:exit()end

function attackState:update(dt)

    timer = timer + dt
    
    --print so and so attacked
    if stage == 0 then
        
        if timer > 0.6 then
            timer = 0
            stage = stage + 1
        end

    --flash the hurting pokemon
    elseif stage == 1 then

        if timer > 0.8 then
            timer = 0
            stage = stage + 1
        end

        flashTimer = flashTimer + dt

    --healthbar goes down
    elseif stage == 2 then

    timer = timer + dt
    
    --print so and so attacked
    if stage == 0 then
        
        if timer > 0.6 then
            timer = 0
            stage = stage + 1
        end

    --flash the hurting pokemon
    elseif stage == 1 then

        if timer > 0.8 then
            timer = 0
            stage = stage + 1
        end

        flashTimer = flashTimer + dt

    --healthbar goes down
    elseif stage == 2 then

        --linear scaling of the health, makes the healthbar lower at a constant rate
        defender.health = math.max(0, math.max(currentHealth, defender.health - 50 * dt))

        if defender.health == currentHealth or defender.health == 0 then
            timer = 0
            
            if criticalHit == 2 then
                stage = stage + 1
            elseif criticalHit == 1 then
                stage = stage + 2
            end
        end

    --if its  crit, it'll print that
    elseif stage == 3 then

        if timer > 1 then
            timer = 0
            stage = stage + 1
        end

    --check if the Goomon is dead
    elseif stage == 4 then

        if turn == "player" then
            print("bodge")
            playerParty[1] = attacker
        else
            playerParty[1] = defender
        end

        if defender.health == 0 then
            hasAttacked = false

            if turn == "player" then
                pushState(fadeOutState, {playState, "b"})
            else
                -- if the knocked out Goomon is the players, check if all their party is knocked out, if so, send them to the defeat screen
                for i = 1, #playerParty do
                    if playerParty[i].health > 0 then
                        alive = true
                        break
                    else
                        alive = false
                    end
                end
    
                if alive == false then
                    pushState(fadeOutState, {defeatState, "b"})
                else
                    popState()
                end
            end
        elseif defender.health == currentHealth then
            
            if hasAttacked == false then
                if turn == "player" then
                    turn = "wild"
                else
                    turn = "player"
                end
                hasAttacked = true
                --if the other goomon hasnt attacked, call the state again but switch whos attacking and whos defending
                changeState(attackState, {defender, attacker, turn})
            else
                hasAttacked = false
                popState()
            end

        end

            if hasAttacked == false then
                if turn == "player" then
                    turn = "wild"
                else
                    turn = "player"
                end
                hasAttacked = true
                --if the other goomon hasnt attacked, call the state again but switch whos attacking and whos defending
                changeState(attackState, {defender, attacker, turn})
            else
                hasAttacked = false
                popState()
            end

        end

    end
    
    
end

function attackState:draw()
        
    if stage == 1 then
        
    if stage == 1 then

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

    elseif stage == 2 then
    elseif stage == 3 then
        textBox("It was a critical hit!", 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8)
    end

    if stage < 3 then
        textBox(string.upper(attacker.name) .. " attacked " .. string.upper(defender.name), 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8)

    elseif stage == 2 then
    elseif stage == 3 then
        textBox("It was a critical hit!", 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8)
    end

    if stage < 3 then
        textBox(string.upper(attacker.name) .. " attacked " .. string.upper(defender.name), 0, 7*GAME_HEIGHT/8, GAME_WIDTH, GAME_HEIGHT/8)
    end

    love.graphics.setShader()
    
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