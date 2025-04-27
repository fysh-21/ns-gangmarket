ESX = exports["es_extended"]:getSharedObject()
Config = Config or {}

exports.ox_inventory:RegisterShop('gang_market', {
    name = 'Gang Market',
    inventory = Config.Items
})

