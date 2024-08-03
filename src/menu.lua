local currentItem = 0

local myMenu = {
    title = "Default Menu",
    items = {
        "Items 1",
        "Items 2"
    }
}

local defaultColor = {r = 0, g = 150, b = 255, a = 255}
local selectedColor = {r = 255, g = 0, b = 0, a = 200}

function DrawMenu()
    DrawRect(0.8, 0.4, 0.2, 0.5, 175, 145, 210, 255)

    local count = 0.2
    local index = 0
    for i, items in ipairs(myMenu['items']) do
        local color = (i-1 == currentItem) and selectedColor or defaultColor
        SetTextEntry("STRING")
        AddTextComponentString(items)
        SetTextScale(0.0*1, 0.55*1)
        SetTextFont(0)
        DrawText(0.7, count - 0.02)
        DrawRect(0.8, count, 0.2, 0.05, color.r, color.g, color.b, color.a)
        count = count + 0.075
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
end