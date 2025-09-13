local MenuPool = NativeUI.CreatePool()
local ledMenu = NativeUI.CreateMenu(Config.Locales['menuTitle'], Config.Locales['menuSubtitle'])
MenuPool:Add(ledMenu)
MenuPool:RefreshIndex()

local currentVehicle = nil
local selectedLED = nil

-- Function to set LED color
local function SetVehicleLEDsColor(vehicle, r, g, b)
    SetVehicleNeonLightsColour(vehicle, r, g, b)
    for i = 0, 3 do
        SetVehicleNeonLightEnabled(vehicle, i, true)
    end
end

-- Auxiliary function to read current vehicle LED
local function GetCurrentLEDColor(vehicle)
    local r, g, b = GetVehicleNeonLightsColour(vehicle)
    return {r=r, g=g, b=b}
end

-- Build menu
local function BuildLEDMenu(vehicle)
    ledMenu:Clear()
    local currentColor = GetCurrentLEDColor(vehicle)

    for name, color in pairs(Config.LEDs) do
        local item = NativeUI.CreateItem(name, "")
        -- Preselection if color matches
        if color.r == currentColor.r and color.g == currentColor.g and color.b == currentColor.b then
            selectedLED = item
        end
        ledMenu:AddItem(item)
        item.Activated = function(parentmenu, selecteditem)
            SetVehicleLEDsColor(vehicle, color.r, color.g, color.b)
            selectedLED = item
            TriggerEvent('chat:addMessage', { args = { string.format(Config.Locales['ledChanged'], name) } })
        end
    end
    MenuPool:RefreshIndex()
end


RegisterNetEvent('ledMenu:open', function()
    local playerPed = PlayerPedId()
    if not IsPedInAnyVehicle(playerPed, false) then
        TriggerEvent('chat:addMessage', { args = { Config.Locales['menuNoCar'] } })
        return
    end

    currentVehicle = GetVehiclePedIsIn(playerPed, false)
    BuildLEDMenu(currentVehicle)

    
    ledMenu:Visible(true)

    
    FreezeEntityPosition(playerPed, true)
    SetPlayerControl(PlayerId(), false, 256)
end)


Citizen.CreateThread(function()
    while true do
        MenuPool:ProcessMenus()
        Wait(0)

        if ledMenu:Visible() then
            
            local playerPed = PlayerPedId()
            FreezeEntityPosition(playerPed, true)
            SetPlayerControl(PlayerId(), false, 256)
        else
            
            local playerPed = PlayerPedId()
            FreezeEntityPosition(playerPed, false)
            SetPlayerControl(PlayerId(), true, 0)
        end
    end
end)

-- Register keybind
RegisterKeyMapping('openLEDMenu', Config.Locales['keybind'], 'keyboard', 'F5')
RegisterCommand('openLEDMenu', function()
    TriggerEvent('ledMenu:open')
end, false)
