ESX = exports["es_extended"]:getSharedObject()

local function Notify(des, type)
    lib.notify({
        description = des,
        type = type,
    })
end

local function isAllowedGang()
    for i, gangs in ipairs(Config.Gangs) do
        if ESX.GetPlayerData().job.name == gangs then
            return true
        end
    end
    return false
end

local function OpenGangMarket()
    if not isAllowedGang() then
        return Notify("Du har ikke adgang til dette!", "error")
    end

    exports.ox_inventory:openInventory('shop', { type = 'gang_market' })
end

local function SpawnPed()
    RequestModel(Config.Ped.Model)
    
    while not HasModelLoaded(Config.Ped.Model) do
        Wait(10)
    end

    local ped = CreatePed(0, Config.Ped.Model, Config.Ped.Coords.x, Config.Ped.Coords.y, Config.Ped.Coords.z, Config.Ped.Coords.w, false, false)

    if ped then
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedCanRagdoll(ped, false)
        SetPedDiesWhenInjured(ped, false)
        SetEntityProofs(ped, true, true, true, true, true, true, true, true)
    end

    exports.ox_target:addLocalEntity(ped, {
        {
            label = 'Åbn Gang Market',
            icon = 'fa-solid fa-shop',
            onSelect = function()
                OpenGangMarket()
            end
        }
    })    
end

CreateThread(function()
    SpawnPed()
end)
