battleMenuState = {}
local wildPokemon

function battleMenuState:enter()
    --select the wild pokemon to be the one of the pokemon that can spawn in hte current route
    wildPokemon = routeOne["wildPokemon"][math.random(1, #routeOne["wildPokemon"])]

    local params = {defPokemon[wildPokemon][1], 3*GAME_WIDTH/4, GAME_HEIGHT/10, "left", 2}
    pushState(slideImageState, params)
end

function battleMenuState:exit()end

function battleMenuState:update(dt)
    popState()
end

function battleMenuState:draw()end