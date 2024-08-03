local currentItem = 0

local menu = false

local myMenu = {
    title = "Default Menu",
    items = {
        {name = "Zentorno", id = "zentorno"},
        {name = "Adder", id = "adder"}
    }
}

local defaultColor = {r = 75, g = 75, b = 75, a = 220}
local selectedColor = {r = 255, g = 255, b = 255, a = 200}

local defaultTextColor = {r = 255, g = 255, b = 255, a = 255}
local selectedTextColor = {r = 0, g = 0, b = 0, a = 255}

function DrawMenu()
    -- Frame
    DrawRect(0.8, 0.4, 0.2, 0.5, 42, 42, 42, 150)

    --title
    SetTextEntry("STRING")
    AddTextComponentString(myMenu.title)
    SetTextScale(0.0*1, 0.55*1)
    SetTextFont(0)
    DrawText(0.7, 0.15)

    -- Items
    local count = 0.22
    for i, items in ipairs(myMenu['items']) do
        local color = (i-1 == currentItem) and selectedColor or defaultColor
        local textColor =  (i-1 == currentItem) and selectedTextColor or defaultTextColor

        SetTextEntry("STRING")
        AddTextComponentString(items.name)
        SetTextScale(0.0*1, 0.55*1)
        SetTextFont(0)
        SetTextColour(textColor.r, textColor.g, textColor.b, textColor.a)

        DrawText(0.7, count - 0.02)
        DrawRect(0.8, count, 0.2, 0.05, color.r, color.g, color.b, color.a)
        count = count + 0.055
    end
end

function UpdateMenu()
    if IsControlJustPressed(0, 300) then
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
        currentItem = (currentItem - 1 + #myMenu['items']) % #myMenu['items']
    elseif IsControlJustPressed(0, 299) then
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
        currentItem = (currentItem + 1) % #myMenu['items']
    end

    if(IsControlJustPressed(0, 191)) then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
        SpawnVehicle(myMenu['items'][currentItem+1].id)
        menu = false
    end
    if(IsControlJustPressed(0, 194)) then
        PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
        menu = false
    end
end

CreateThread(function()
    while true do
        Wait(5)
        if(menu) then
            DrawMenu()
            UpdateMenu()
        end
    end
end)

RegisterCommand('menu', function()
    menu = not menu
end, false)