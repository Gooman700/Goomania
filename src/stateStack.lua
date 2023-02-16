stateStack = {}

function pushState(newState, params)
    newState:enter(newState)
    table.insert(stateStack, newState)
end

function popState()
    stateStack[#stateStack]:exit()
    table.remove(stateStack, #stateStack)--when called without an element specified, removes the last element
end

function changeState(newState)
    popState()
    pushState(newState)
end

function clearState(newState)
    for i = 1, #stateStack do
        table.remove(stateStack, i)
    end
    pushState(newState)
end