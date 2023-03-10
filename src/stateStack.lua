stateStack = {}

function pushState(newState, params)
    table.insert(stateStack, newState)
    newState:enter(params)
end

function popState()
    local previousState = stateStack[#stateStack]
    table.remove(stateStack)--when called without an element specified, removes the last element
    previousState:exit()
end

function changeState(newState, params)
    popState()
    pushState(newState, params)
end

function clearState(newState)   
    while #stateStack > 0 do
        popState()
    end
    pushState(newState)
end