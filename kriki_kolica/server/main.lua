local ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem("kolica", function(source)
    TriggerClientEvent('kriki_kolica', source)
    print('Majmune')
end)