AddEventHandler("Dealerships:Client:StartBuyback", function(entity, data)
    print(json.encode(entity))

    local vehNet = VehToNet(entity.entity)
    local vehEnt = plsr.State.Entity(entity.entity)

    plsr.Callbacks:ServerCallback("Dealerships:BuyBackStart", {
        netId = vehNet,
        dealerId = plsr.State.flags.onDuty,
    }, function(success, data, strikes, price, strikeLoss)
        if success then
            local dealerData = _dealerships[plsr.State.flags.onDuty]

            plsr.Confirm:Show(
                string.format("Confirm %s Vehicle Buy Back", dealerData.abbreviation),
                {
                    yes = "Dealerships:BuyBack:Confirm",
                    no = "Dealerships:BuyBack:Deny",
                },
                string.format(
                    [[
                        Please confirm that %s wants to buy back this vehicle.<br>
                        Vehicle: %s %s<br>
                        Class: %s<br>
                        Plate: %s<br>
                        VIN: %s<br>
                        Buyback Price: $%s %s<br>
                    ]],
                    dealerData.name,
                    data.make or "Unknown",
                    data.model or "Unknown",
                    data.class or "?",
                    vehEnt.RegisteredPlate,
                    vehEnt.VIN,
                    formatNumberToCurrency(price),
                    strikes > 0 and string.format("<i>-$%s (%s Strikes)</i>", formatNumberToCurrency(strikeLoss), strikes) or ""
                ),
                {
                    netId = vehNet,
                    dealerId = plsr.State.flags.onDuty,
                },
                "Deny",
                "Confirm"
            )
        else
            if data then
                plsr.Notification:Error(data)
            else
                plsr.Notification:Error("Error")
            end
        end
    end)
end)

AddEventHandler("Dealerships:BuyBack:Confirm", function(data)
    plsr.Callbacks:ServerCallback("Dealerships:BuyBack", data, function(success)
        
    end)
end)

AddEventHandler("Dealerships:BuyBack:Deny", function(data)
    plsr.Notification:Error("Vehicle Buy Back Cancelled")
end)