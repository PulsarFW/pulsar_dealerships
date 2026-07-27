RegisterNetEvent('FleetDealers:Server:Purchase', function(shop, vehicle, livery, workplaceId, qual)
    local src = source
    local shopData = _fleetConfig[shop]
    local char = plsr.Fetch:CharacterSource(src)

    if workplaceId == "false" or workplaceId == "all" then
        workplaceId = false
    end
    if not qual or qual == "false" or qual == "all" then
        qual = false
    end

    if char and shopData and plsr.Jobs.Permissions:HasPermissionInJob(src, shopData.job, shopData.requiredPermission) then
        local chosenVehicle = shopData.vehicles[vehicle]
        if chosenVehicle and chosenVehicle.liveries[livery] ~= nil then
            local purchaseBankAccount = plsr.Banking.Accounts:GetOrganization(shopData.bankAccount)
            if purchaseBankAccount and purchaseBankAccount.Account then
                if plsr.Banking.Balance:Charge(purchaseBankAccount.Account, chosenVehicle.price, {
                    type = 'bill',
                    title = 'Fleet Vehicle Purchase',
                    description = string.format(
                        'Fleet Vehicle Purchase - %s %s By %s %s (%s)',
                        chosenVehicle.make,
                        chosenVehicle.model,
                        char:GetData('First'),
                        char:GetData('Last'),
                        char:GetData('SID')
                    )
                }) then
                    local properties = table.copy(chosenVehicle.defaultProperties)
                    properties.livery = livery
                    Wait(200)
                    plsr.Vehicles.Owned:AddToFleet(
                        shopData.job,
                        workplaceId,
                        0,
                        chosenVehicle.vehicle,
                        chosenVehicle.type or 0,
                        chosenVehicle.modelType,
                        {
                            make = chosenVehicle.make,
                            model = chosenVehicle.model,
                            class = chosenVehicle.class,
                            value = chosenVehicle.price,
                        },
                        function(success, vehicle)
                            if success and vehicle then
                                plsr.Execute:Client(src, 'Notification', 'Success', string.format('Fleet Vehicle Purchase of a %s %s was Successful.<br><br>VIN: %s<br>Plate: %s', chosenVehicle.make, chosenVehicle.model, vehicle.VIN, vehicle.RegisteredPlate), 5000)
                            else
                                plsr.Logger:Error('Dealerships', string.format('Purchase of Fleet Vehicle Failed After Taking %s Cash from Bank Account: %s', chosenVehicle.price, purchaseBankAccount.Account))
                                plsr.Execute:Client(src, 'Notification', 'Error', 'Fleet Vehicle Purchase Failed', 5000)
                            end
                        end,
                        properties,
                        qual
                    )
                else
                    plsr.Execute:Client(src, 'Notification', 'Error', 'Fleet Vehicle Purchase Failed - Not Enough Money in the Bank', 5000)
                end
            else
                plsr.Execute:Client(src, 'Notification', 'Error', 'Fleet Vehicle Purchase Failed', 5000)
            end
        else
            plsr.Execute:Client(src, 'Notification', 'Error', 'Fleet Vehicle Purchase Failed - Invalid Vehicle', 5000)
        end
    else
        plsr.Execute:Client(src, 'Notification', 'Error', 'Fleet Vehicle Purchase Failed', 5000)
    end
end)