function DrawMenu()
    DrawRect(0.8, 0.4, 0.2, 0.5, 0, 255, 255, 255)
end

function UpdateMenu()
    if IsControlJustPressed(0, 300) then
        TriggerEvent('chat:addMessage', {
            args = {"Navigation menu UP"}
        })
    elseif IsControlJustPressed(0, 299) then
        TriggerEvent('chat:addMessage', {
            args = {"Navigation menu DOWN"}
        })
    end
end