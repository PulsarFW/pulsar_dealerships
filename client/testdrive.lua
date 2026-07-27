AddEventHandler("Vehicles:Client:BecameDriver", function(vehicle, seat)
	local vehState = plsr.State.Entity(vehicle)
	if vehState and vehState.testDrive then
		TriggerServerEvent("Vehicles:Server:TestDriveTime", VehToNet(vehicle))
	end
end)
