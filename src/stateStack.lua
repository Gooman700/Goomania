stateStack = {}

function pushState(newState, params)
    table.insert(stateStack, newState)
    newState:enter(params)
end

function popState()
    -- stateStack[#stateStack]:exit()
    table.remove(stateStack)--when called without an element specified, removes the last element
end

function changeState(newState)
    popState()
    pushState(newState)
end

function clearState(newState)
    while #stateStack > 0 do
        popState()
    end
    pushState(newState)
end