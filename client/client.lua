characterLoaded = false
_withinShowroom = false
_withinCatalog = false

_justBoughtBike = {}
-- DEALERSHIPS = {}

CreateThread(function()
	CreateDealerships()

	CreateRentalSpots()
	CreateBikeStands()
	CreateGovermentFleetShops()

	CreateDonorDealerships()
end)

RegisterNetEvent("Characters:Client:Spawn")
AddEventHandler("Characters:Client:Spawn", function()
	characterLoaded = true

	CreateDealershipBlips()
	CreateRentalSpotsBlips()
	CreateBikeStandBlips()
end)

RegisterNetEvent("Characters:Client:Logout")
AddEventHandler("Characters:Client:Logout", function()
	characterLoaded = false

	_justBoughtBike = {}
end)

-- AddEventHandler('Proxy:Shared:RegisterReady', function()
--     exports['pulsar_core']:RegisterComponent('Dealerships', DEALERSHIPS)
-- end)

function CreatePolyzone(id, zone, data)
	if zone.type == "poly" then
		plsr.Polyzone.Create:Poly("dealerships_" .. id, zone.points, zone.options, data)
	elseif zone.type == "box" then
		plsr.Polyzone.Create:Box("dealerships_" .. id, zone.center, zone.length, zone.width, zone.options, data)
	elseif zone.type == "circle" then
		plsr.Polyzone.Create:Circle("dealerships_" .. id, zone.center, zone.radius, zone.options, data)
	end
end

function CreateDealerships()
	for dealerId, data in pairs(_dealerships) do
		-- Polyzones
		if data.zones then
			if data.zones.dealership then
				CreatePolyzone(dealerId .. "_main", data.zones.dealership, {
					dealer = true,
					dealerId = dealerId,
					type = "main",
				})
			end

			if #data.zones.catalog > 0 then
				for k, v in ipairs(data.zones.catalog) do
					CreatePolyzone((dealerId .. "_catalog_" .. k), v, {
						dealer = true,
						dealerId = dealerId,
						type = "catalog",
					})
				end
			end

			if data.zones.buyback then
				CreatePolyzone(dealerId .. "_buyback", data.zones.buyback, {
					dealer = true,
					dealerId = dealerId,
					type = "buyback",
					dealerBuyback = true,
				})
			end
		end

		-- Targets
		if data.zones and #data.zones.employeeInteracts > 0 then
			for k, v in ipairs(data.zones.employeeInteracts) do
				plsr.Targeting.Zones:AddBox(
					string.format("dealership_%s_employee_%s", dealerId, k),
					"car",
					v.center,
					v.length,
					v.width,
					v.options,
					{
						{
							icon = "warehouse",
							text = "Edit Showroom",
							event = "Dealerships:Client:ShowroomManagement",
							data = { dealerId = dealerId },
							jobPerms = {
								{
									job = dealerId,
									reqDuty = true,
									permissionKey = "dealership_showroom",
								},
							},
						},
						-- {
						--     icon = 'magnifying-glass-dollar',
						--     text = 'Run Credit Check',
						--     event = 'Dealerships:Client:StartRunningCredit',
						--     data = { dealerId = dealerId },
						--     jobPerms = {
						--         {
						--             job = dealerId,
						--             reqDuty = true,
						--             permissionKey = 'dealership_sell',
						--         }
						--     },
						-- },
						-- {
						--     icon = 'file-invoice-dollar',
						--     text = 'Sell Vehicle',
						--     event = 'Dealerships:Client:OpenSales',
						--     data = { dealerId = dealerId },
						--     jobPerms = {
						--         {
						--             job = dealerId,
						--             reqDuty = true,
						--             permissionKey = 'dealership_sell',
						--         }
						--     },
						-- },
						-- {
						--     icon = 'memo-pad',
						--     text = 'View Stock',
						--     event = 'Dealerships:Client:StockViewing',
						--     data = { dealerId = dealerId },
						--     jobPerms = {
						--         {
						--             job = dealerId,
						--             reqDuty = true,
						--             permissionKey = 'dealership_stock',
						--         }
						--     },
						-- },
						-- {
						--     icon = 'pen-to-square',
						--     text = 'Dealer Management',
						--     event = 'Dealerships:Client:StartManagement',
						--     data = { dealerId = dealerId },
						--     jobPerms = {
						--         {
						--             job = dealerId,
						--             reqDuty = true,
						--             permissionKey = 'dealership_manage',
						--         }
						--     },
						-- },
						{
							icon = "briefcase-clock",
							text = "Go On Duty",
							event = "Dealerships:Client:ToggleDuty",
							data = { dealerId = dealerId, state = true },
							jobPerms = {
								{
									job = dealerId,
									reqOffDuty = true,
								},
							},
						},
						{
							icon = "briefcase-clock",
							text = "Go Off Duty",
							event = "Dealerships:Client:ToggleDuty",
							data = { dealerId = dealerId, state = false },
							jobPerms = {
								{
									job = dealerId,
									reqDuty = true,
								},
							},
						},
						-- {
						-- 	icon = "tablet-screen",
						-- 	text = "Open Tablet",
						-- 	event = "MDT:Client:Toggle",
						-- 	data = {},
						-- 	jobPerms = {
						-- 		{
						-- 			job = dealerId,
						-- 			reqDuty = true,
						-- 		},
						-- 	},
						-- },
					},
					3.5
				)
			end
		end
	end
end

function CreateDealershipBlips()
	for dealerId, data in pairs(_dealerships) do
		if data.blip then
			plsr.Blips:Add(
				"dealership_" .. dealerId,
				data.name,
				data.blip.coords,
				data.blip.sprite,
				data.blip.colour,
				data.blip.scale
			)
		end
	end
end

AddEventHandler("Polyzone:Enter", function(id, point, insideZones, data)
	if characterLoaded and data and data.dealer and data.dealerId and data.type then
		if data.type == "main" then
			_withinShowroom = data.dealerId
			SpawnShowroom(data.dealerId)
		elseif data.type == "catalog" and _dealerships[data.dealerId] then
			_withinCatalog = data.dealerId
			plsr.Action:Show(
				"pdm",
				"{keybind}primary_action{/keybind} View " .. _dealerships[data.dealerId].abbreviation .. " Catalog"
			)
		end
	end
end)

AddEventHandler("Polyzone:Exit", function(id, point, insideZones, data)
	if data and data.dealer and data.dealerId and data.type then
		if data.type == "main" then
			DeleteShowroom(data.dealerId)
			_withinShowroom = false
		elseif data.type == "catalog" then
			plsr.Action:Hide("pdm")
			_withinCatalog = false
			ForceCloseCatalog()
		end
	end
end)

AddEventHandler("Keybinds:Client:KeyUp:primary_action", function()
	if _withinCatalog then
		plsr.Action:Hide("pdm")
		OpenCatalog(_withinCatalog)
	end
end)

AddEventHandler("Dealerships:Client:ToggleDuty", function(entityData, data)
	if data and data.dealerId then
		if data.state then
			plsr.Jobs.Duty:On(data.dealerId)
		else
			plsr.Jobs.Duty:Off(data.dealerId)
		end
	end
end)
