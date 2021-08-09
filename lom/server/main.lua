ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('twojstaryjestnajebanyjakzawsze:giveItem')
AddEventHandler('twojstaryjestnajebanyjakzawsze:giveItem' ,function()

    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.addMoney(10000)

end)

ESX.RegisterServerCallback("twojstaryjestnajebanyjakzawsze:check", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    local item = xPlayer.getInventoryItem("sprzet")["count"]

    if item >= 1 then
        xPlayer.removeInventoryItem("sprzet", 1)
        cb(true)
    else
        cb(false)
    end
end)